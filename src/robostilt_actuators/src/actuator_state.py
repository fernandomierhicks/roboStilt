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
from robostilt_common.srv import SetPosition
from robostilt_common.srv import SetPositionRequest
from robostilt_common.srv import SetPositionResponse


# Manages all actuators


class Actuators():

    # -------------------------------------------------------------------------------------------------------  GLOBALS
    state = ActuatorState()
    ros_rate = None
    publisher = None
    actionClient = []

    # -------------------------------------------------------------------------------------------------------  CALLBACKS
    def publish_state(self):
        self.state.header.stamp = rospy.Time.now()
        self.publisher.publish(self.state)

    def _joint_states_callback(self, msg):
        # Maps positions,velocities and efforts from joint_states
        j = [6, 0, 1, 2, 3, 4, 5, 7]  # order in joint_states message
        for i in range(0, self.state.COUNT):
            joint_index = j[i]
            self.state.name[i] = msg.name[joint_index]
            self.state.position[i] = msg.position[joint_index]
            self.state.velocity[i] = msg.velocity[joint_index]
            self.state.effort[i] = msg.effort[joint_index]
        self.publish_state()

    def _position_goal_complete(self, state, result):
        # One motor completed its action
        rospy.loginfo(state)
        rospy.loginfo(result)
    # ---------------------------------------------------------------------------------------------------------  ROS

    def setup_ros_interface(self):
        # Variables
        rate = 100
        package_name = "actuators"
        node_name = "actuator_states"
        # Node
        rospy.init_node(node_name, anonymous=False)
        self.ros_rate = rospy.Rate(rate)
        rospy.loginfo("Node robostilt/"+package_name +
                      "/" + node_name + " started.")
        # Publishers
        self.publisher = rospy.Publisher(
            '/robostilt/actuator_states', ActuatorState, queue_size=1, latch=True)

        # get parameters

        # Subscribers
        topic_name = "/robostilt/joint_states"
        rospy.Subscriber(topic_name,
                         JointState, self._joint_states_callback)
        # Services
        service_set_position = rospy.Service(
            'robostilt/actuator_states/set_position', SetPosition, self.set_position)
        # wait for...
        rospy.loginfo("Waiting for message on topic " + topic_name + " ...")
        rospy.wait_for_message(topic_name, JointState)
        rospy.loginfo("Ready")

    # ---------------------------------------------------------------------------------------------------------  METHODS
    def initialize_state(self):
        for i in range(0, self.state.COUNT):
            self.state.name.append(0)
            self.state.position.append(0)
            self.state.velocity.append(0)
            self.state.effort.append(0)
            self.state.effort_limit.append(0)

            self.state.manipulation.append(0)
            self.state.progress.append(0)
            self.state.position_setpoint.append(0)

            self.state.is_moving.append(0)
            self.state.is_ready.append(0)
            self.state.has_been_homed.append(0)
            self.state.is_supporting_weight.append(0)

    def initialize_action_clients(self):
        rospy.wait_for_message("/robostilt/joint_states", JointState)
        # needs to wait for joint_states to be published so self.state.name gets populated
        for i in range(0, self.state.COUNT):
            controller_name = "/robostilt/"+self.state.name[i] + \
                "_trajectory_controller/follow_joint_trajectory"

            self.actionClient.append(actionlib.SimpleActionClient(
                controller_name, FollowJointTrajectoryAction))

    def set_position(self, request):
        goals = []
        # prepare goals
        for i in range(0, len(request.index)):
            actuator_index = request.index[i]
            position = request.position[i]
            velocity = request.velocity[i]
            effort = request.effort[i]
            rospy.loginfo(request.index[0])

            goals.append(self.create_position_goal(
                actuator_index, position, velocity))
        # send all at once
        for i in range(0, len(request.index)):
            self.send_position_goal(i, goals[i])

        rospy.loginfo(request.position)
        return SetPositionResponse(True)

    def send_position_goal(self, index, goal):
        # send goal and register callback when done
        self.actionClient[index].send_goal(
            goal, done_cb=self._position_goal_complete)

        self.state.is_moving[index] = True
        self.state.is_ready[index] = False

    def create_position_goal(self, index, position_setpoint, velocity):
        joint_name = self.state.name[index]
        current_position = self.state.position[index]
        self.state.position_setpoint = position_setpoint
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
        trajectory.joint_names.append(joint_name)
        follow_trajectory_goal = FollowJointTrajectoryGoal()
        follow_trajectory_goal.trajectory = trajectory
        # TOLERANCES FOR MOVE
        # For some reason the defaults are not being loaded from control.yaml
        tolerance = JointTolerance()

        tolerance.name = joint_name  # joint name
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

    # ---------------------------------------------------------------------------------------------------------  INIT

    def __init__(self):
        self.initialize_state()
        self.setup_ros_interface()
        self.initialize_action_clients()


if __name__ == '__main__':
    try:
        actuators = Actuators()
        while not rospy.is_shutdown():
            rospy.spin()
    except rospy.ROSInterruptException:
        pass
