#! /usr/bin/env python
import rospy
import actionlib
from control_msgs.msg import FollowJointTrajectoryGoal
from control_msgs.msg import FollowJointTrajectoryAction
from control_msgs.msg import JointTolerance
from sensor_msgs.msg import JointState
from trajectory_msgs.msg import JointTrajectory
from trajectory_msgs.msg import JointTrajectoryPoint
from robostilt_common.msg import ActuatorState
from robostilt_common.msg import ActuatorsState
from robostilt_common.srv import SetPosition
from robostilt_common.srv import SetPositionRequest
from robostilt_common.srv import SetPositionResponse


# Manages all actuators and populates ActuatorsState with ActuatorsState[] and sends
# Needs an ActuatorClass because each actuator has its own ros_controller

class ActuatorClass():
   
    message = ActuatorState()
    actionClient = None
    

    def populate_name(self, joint_name):
        self.message.name = joint_name
        controller_name = "/robostilt/"+self.message.name + \
            "_trajectory_controller/follow_joint_trajectory"
        # f.print_ros("Setting Action client of " + self.name )
        self.actionClient = actionlib.SimpleActionClient(
            controller_name, FollowJointTrajectoryAction)        
        
    def _position_goal_complete(self, state, result):
        if(result.error_code == 0):
            # rospy.loginfo(self.name + " has reached goal.")
            # reset client
            self.actionClient.cancel_all_goals()
            self.actionClient.stop_tracking_goal()
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

    def set_position(self, position, velocity, effort):
        goal = self.create_position_goal(position, velocity)
        self.send_position_goal(goal)
        # #log info
        # f.print_ros(self.name + " new position set to: " + str(self.goal_position) + " old position is: " +
        #             str(self.position) + " allowed time is is: " + f.str_time(self.goal_duration_time_limit))

    def send_position_goal(self, goal):
         # send goal and register callback when done
        self.actionClient.send_goal(
            goal, done_cb=self._position_goal_complete)

    def create_position_goal(self, position_setpoint, velocity):
        current_position = self.message.position
        # set up variables
        trajectory = JointTrajectory()
        point = JointTrajectoryPoint()
        # Final position
        point.positions = [position_setpoint]
        trajectory.points.append(point)
        # How long to get there
        time_for_move = abs(current_position-position_setpoint)/velocity
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
    actuators = [ActuatorClass()]
    ros_rate = None
    publisher = None
    # -------------------------------------------------------------------------------------------------------  CALLBACKS

    def publish_state(self):
        self.message.header.stamp = rospy.Time.now()

        for i in range(0, ActuatorsState.COUNT):

            self.actuators[1].message.name="1"
            self.actuators[2].message.name="2"
            self.message.actuators[i]=self.actuators[i].message
        
        self.publisher.publish(self.message)

    def _joint_states_callback(self, msg):
        # Maps positions,velocities and efforts from joint_states
        j=[6, 0, 1, 2, 3, 4, 5, 7]  # order in joint_states message
        for i in range(0, ActuatorsState.COUNT):
            joint_index=j[i]
            #name
            name=msg.name[joint_index]
            self.message.actuators[i].name=name  # populate actuators message
            if(self.actuators[i].message.name == ""):  # only once
                # populate actuator class instance
                self.actuators[i].populate_name(name)
            #position
            self.message.actuators[i].position=msg.position[joint_index]
            self.actuators[i].position=msg.position[joint_index] # used to compute velocity for position goals

            self.message.actuators[i].velocity=msg.velocity[joint_index]
            self.message.actuators[i].effort=msg.effort[joint_index]
        self.publish_state()
    # ---------------------------------------------------------------------------------------------------------  ROS

    def setup_ros_interface(self):
        # Variables
        rate=100
        package_name="actuators"
        node_name="actuator_states"
        # Node
        rospy.init_node(node_name, anonymous=False)
        self.ros_rate=rospy.Rate(rate)
        rospy.loginfo("Node robostilt/"+package_name +
                      "/" + node_name + " started.")
        # Publishers
        self.publisher=rospy.Publisher(
            '/robostilt/actuator_states', ActuatorsState, queue_size=1, latch=True)

        # get parameters

        # Subscribers
        topic_name="/robostilt/joint_states"
        rospy.Subscriber(topic_name,
                         JointState, self._joint_states_callback)
        # Services
        service_set_position=rospy.Service(
            'robostilt/actuator_states/set_position', SetPosition, self.set_position)
        # wait for...
        rospy.loginfo("Waiting for message on topic " + topic_name + " ...")
        rospy.wait_for_message(topic_name, JointState)
        rospy.loginfo("Ready")

    # ---------------------------------------------------------------------------------------------------------  METHODS
    def initialize_actuators(self):
        # first is already in the array as part of the variable definition
        for i in range(0, ActuatorsState.COUNT-1):
            self.actuators.append(ActuatorClass())

        for i in range(0, ActuatorsState.COUNT):
            self.message.actuators.append(ActuatorState())

    def set_position(self, request):

        for i in range(0, len(request.index)):
            actuator_index=request.index[i]
            position=request.position[i]
            velocity=request.velocity[i]
            effort=request.effort[i]
            self.actuators[actuator_index].set_position(
                position, velocity, effort)
        return SetPositionResponse(True)
    # ---------------------------------------------------------------------------------------------------------  INIT

    def __init__(self):
        self.initialize_actuators()
        self.setup_ros_interface()


if __name__ == '__main__':
    try:
        actuators=ActuatorsClass()
        while not rospy.is_shutdown():
            rospy.spin()
    except rospy.ROSInterruptException:
        pass
