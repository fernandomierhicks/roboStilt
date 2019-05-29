#! /usr/bin/env python
import rospy
import actionlib
from control_msgs.msg import FollowJointTrajectoryGoal
from control_msgs.msg import FollowJointTrajectoryAction
from control_msgs.msg import FollowJointTrajectoryFeedback
from control_msgs.msg import JointTolerance
from sensor_msgs.msg import JointState
from trajectory_msgs.msg import JointTrajectory
from trajectory_msgs.msg import JointTrajectoryPoint

from robostilt_common.msg import *
from robostilt_common.srv import *


# Manages all actuators and populates
# Needs an ActuatorClass because each actuator has its own ros_controller. Reason for this on control.yaml
class EffortLimit():
    upper = None
    lower = None

    def __init__(self):
        self.upper = 0
        self.lower = 0


class ActuatorClass():

    message = None
    actionClient = None

    boost_duration = None
    boost_level = None
    nominal_effort_limit = None

    def __init__(self):
        self.message = SingleActuator()
        self.message.is_moving = False
        self.message.is_ready = True
        self.update_limits_from_parameters()
        self.message.effort_fault_expected = False

    def update_limits_from_parameters(self):

        self.boost_level = EffortLimit()
        self.boost_level.upper = rospy.get_param(
            "robostilt/efforts/boost_level/upper")
        self.boost_level.lower = rospy.get_param(
            "robostilt/efforts/boost_level/lower")

        self.nominal_effort_limit = EffortLimit()
        self.boost_duration = rospy.get_param(
            "robostilt/durations/boost_duration")

        # Iinitialize effort limit to non-zero
        self.nominal_effort_limit.upper = self.boost_level.upper
        self.nominal_effort_limit.lower = self.boost_level.lower

        self.message.effort_limit_upper = self.nominal_effort_limit.upper
        self.message.effort_limit_lower = self.nominal_effort_limit.lower

    def stop_and_cancel_goals(self):
        self.actionClient.cancel_all_goals()
        self.actionClient.stop_tracking_goal()
        self.message.is_moving = False
        self.message.is_ready = True
        self.message.effort_fault_expected = False
        self.message.effort_limit_upper=self.boost_level.upper
        self.message.effort_limit_lower=self.boost_level.lower

    def initialize_actuator(self, joint_name):
        self.message.name = joint_name
        controller_name = "/robostilt/"+self.message.name + \
            "_trajectory_controller/follow_joint_trajectory"

        self.actionClient = actionlib.SimpleActionClient(
            controller_name, FollowJointTrajectoryAction)

    def _position_goal_complete(self, state, result):
        if(result.error_code == 0):

            # rospy.loginfo(self.name + " has reached goal.")
            # reset client
            self.stop_and_cancel_goals()
        else:
            error_code_to_string = {
                0: "SUCCESS",
                -1: "INVALID_GOAL",
                -2: "INVALID_JOINTS",
                -3: "OLDER_HEADER_TIMESTAMP",
                # Position error exceeded limit during move. Tracking fault",
                -4: "PATH_TOLERANCE_VIOLATED.",
                # Move did not reach goal position with the tolerance needed in the allowed time",
                -5: "GOAL_TOLERANCE_VIOLATED."
            }
            rospy.logerr("FAILED to reach goal." +
                         error_code_to_string.get(result.error_code))
            rospy.loginfo("state")
            rospy.loginfo(state)
            rospy.loginfo("result")
            rospy.loginfo(result)

    def set_position(self, absolute, position, velocity, effort_limit_upper, effort_limit_lower, effort_fault_expected):

        goal = self.create_position_goal(absolute, position, velocity)
        # limits
        self.nominal_effort_limit.upper = effort_limit_upper
        self.nominal_effort_limit.lower = effort_limit_lower

        self.message.effort_limit_upper = self.boost_level.upper
        self.message.effort_limit_lower = self.boost_level.lower
        self.message.effort_fault_expected = effort_fault_expected

        rospy.Timer(rospy.Duration(self.boost_duration),
                    self.boost_limit_callback, True)  # one shot\

        self.send_position_goal(goal)
        self.message.position_goal = position

        # #log info
        # f.print_ros(self.name + " new position set to: " + str(self.goal_position) + " old position is: " +
        #             str(self.position) + " allowed time is is: " + f.str_time(self.goal_duration_time_limit))

    def send_position_goal(self, goal):
         # send goal and register callback when done
        self.actionClient.send_goal(
            goal, done_cb=self._position_goal_complete)
        self.message.is_moving = True
        self.message.is_ready = False

    def boost_limit_callback(self, event):
        # return limits to nominal values
        self.message.effort_limit_upper = self.nominal_effort_limit.upper
        self.message.effort_limit_lower = self.nominal_effort_limit.lower
    
    def call_service(self, service_name, service_type, request):
        rospy.wait_for_service(service_name)
        try:
            service = rospy.ServiceProxy(service_name, service_type)
            result = service(request)
            return result
        except rospy.ServiceException, e:
            print "Service call failed: %s" % e


    def trigger_effort_fault(self):       

        if(self.message.effort_fault_expected is False):
            rospy.loginfo(self.message.name + " tripped UNEXPECTED effort limit with "+str(self.message.effort) +
                          " Limits are: " + str(self.message.effort_limit_upper) + " and "+str(self.message.effort_limit_lower))

            request=TriggerFaultRequest()
            request.fault_code=RobotState.FAULT_EFFORT            
            self.call_service("/robostilt/robot_state/trigger_fault",TriggerFault,request)
        else:
            rospy.loginfo(self.message.name + " tripped EXPECTED effort limit with "+str(self.message.effort) +
                          " Limits are: " + str(self.message.effort_limit_upper) + " and "+str(self.message.effort_limit_lower))
        

        self.stop_and_cancel_goals()
        

    def create_position_goal(self, absolute,position_setpoint, velocity):
        current_position = self.message.position
        # set up variables
        trajectory = JointTrajectory()
        point = JointTrajectoryPoint()
        # Final position
        if(absolute == ActuatorsState.ABS):
            #absolute move
            point.positions = [position_setpoint]
        else:
            #Relative move
            point.positions = [current_position+position_setpoint]

        point.velocities = [0]  # cubic spline in position, smooth moves
        #point.accelerations = [0]  # cubic spline in position, smooth moves
        trajectory.points.append(point)
        # How long to get there
        if(velocity != 0):
            time_for_move = abs(current_position-position_setpoint)/velocity
        else:
            time_for_move = 0  # porbably should handle different
        if(time_for_move <= 0.1):
            time_for_move = 0.1  # probably asserting joint.
        trajectory.points[0].time_from_start = rospy.Duration(time_for_move)
        # specify which joint to move
        trajectory.joint_names.append(self.message.name)
        follow_trajectory_goal = FollowJointTrajectoryGoal()
        follow_trajectory_goal.trajectory = trajectory
        # TOLERANCES FOR MOVE
        # For some reason the defaults are not being loaded from control.yaml
        tolerance = JointTolerance()

        tolerance.name = self.message.name  # joint name
        tolerance.velocity = -1  # no fault for velocity
        tolerance.acceleration = -1  # no fault for acceleration

        # Tracking fault
        tolerance.position = -1
        follow_trajectory_goal.path_tolerance.append(tolerance)

        # End position fault
        tolerance.position = -1  # p.constraints.goal_pos
        follow_trajectory_goal.goal_tolerance.append(tolerance)

        # Time to reach goal precision
        follow_trajectory_goal.goal_time_tolerance = rospy.Duration(10.0)

        return follow_trajectory_goal


class ActuatorsClass():
    # -------------------------------------------------------------------------------------------------------  GLOBALS
    message = ActuatorsState()
    actuators = []
    ros_rate = None
    publisher = None
    ready_to_move = None
    # -------------------------------------------------------------------------------------------------------  CALLBACKS

    def _joint_states_callback(self, msg):
        # Maps positions,velocities and efforts from joint_states
        j = [6, 0, 1, 2, 3, 4, 5, 7]  # order in joint_states message
        for i in range(0, ActuatorsState.COUNT):
            joint_index = j[i]

            name = msg.name[joint_index]
            if(self.actuators[i].message.name == ""):  # only once
                # populate actuator class instance
                self.actuators[i].initialize_actuator(name)

            self.actuators[i].message.position = msg.position[joint_index]
            self.actuators[i].message.velocity = msg.velocity[joint_index]
            self.actuators[i].message.effort = msg.effort[joint_index]

            # effort limits

            if((self.actuators[i].message.effort_limit_lower < self.actuators[i].message.effort < self.actuators[i].message.effort_limit_upper) == False):
                # Effort fault was not expected, trigger real fault
                self.actuators[i].trigger_effort_fault()

        self.publish_state()

    def _robot_state_callback(self, msg):
        # only allow to move if we are not faulted
        if(msg.state != RobotState.STATE_FAULTED):
            self.ready_to_move = True
        else:
            self.ready_to_move = False

    # ---------------------------------------------------------------------------------------------------------  ROS

    def setup_ros_interface(self):
        # Variables
        rate = 100
        package_name = "actuators"
        node_name = "actuators_state"
        # Node
        rospy.init_node(node_name, anonymous=False)
        self.ros_rate = rospy.Rate(rate)
        rospy.loginfo("Node robostilt/" + node_name + " started.")
        # Publishers
        self.publisher = rospy.Publisher(
            '/robostilt/'+node_name, ActuatorsState, queue_size=1, latch=True)

        # get parameters

        # Subscribers
        topic_name = "/robostilt/robot_state"
        rospy.Subscriber(topic_name,
                         RobotState, self._robot_state_callback)

        topic_name = "/robostilt/joint_states"
        rospy.Subscriber(topic_name,
                         JointState, self._joint_states_callback)

        # Services
        rospy.Service('robostilt/'+node_name+'/set_position',
                      SetPosition, self.set_position)

        # Services
        rospy.Service('robostilt/'+node_name+'/stop_all',
                      StopAll, self.stop_all)
        # wait for...
        rospy.loginfo("Waiting for message on topic " + topic_name + " ...")
        rospy.wait_for_message(topic_name, JointState)
        rospy.loginfo("Ready...")

    # ---------------------------------------------------------------------------------------------------------  METHODS
    def initialize_actuators(self):

        for i in range(0, ActuatorsState.COUNT):
            self.actuators.append(ActuatorClass())
            self.message.actuators.append(SingleActuator())

    def set_position(self, request):
        if(self.ready_to_move == True):
            for i in range(0, len(request.indexes)):
                actuator_index = request.indexes[i]
                position = request.positions[i]
                velocity = request.velocities[i]
                effort_limit_upper = request.efforts_limit_upper[i]
                effort_limit_lower = request.efforts_limit_lower[i]
                effort_fault_expected = request.effort_fault_expected[i]
                absolute = request.absolute[i]

                self.actuators[actuator_index].set_position(absolute, 
                    position, velocity, effort_limit_upper, effort_limit_lower, effort_fault_expected)
            return SetPositionResponse(True)
        else:
            rospy.logerr("Attempted to move while faulted. Aborting command.")
            return SetPositionResponse(False)

    def stop_all(self, request):
        for i in range(0, ActuatorsState.COUNT):
            self.actuators[i].stop_and_cancel_goals()
        rospy.logerr("STOPPING ALL ACTUATORS.")
        return StopAllResponse(True)

    def publish_state(self):
        # header
        self.message.header.stamp = rospy.Time.now()
        # actuators
        for i in range(0, ActuatorsState.COUNT):
            self.message.actuators[i] = self.actuators[i].message
        # all ready
        self.message.all_are_ready = self.are_all_actuators_ready()
        # publish
        self.publisher.publish(self.message)

    def are_all_actuators_ready(self):
        for i in range(0, ActuatorsState.COUNT):
            if(self.actuators[i].message.is_ready == False):
                return False
        return True

    # ---------------------------------------------------------------------------------------------------------  INIT

    def __init__(self):
        self.initialize_actuators()
        self.setup_ros_interface()


if __name__ == '__main__':
    try:
        actuators = ActuatorsClass()
        while not rospy.is_shutdown():
            rospy.spin()
    except rospy.ROSInterruptException:
        pass
