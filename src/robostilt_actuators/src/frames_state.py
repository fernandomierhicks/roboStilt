#! /usr/bin/env python
import rospy
from robostilt_common.msg import ActuatorsState
from robostilt_common.msg import FramesState
from robostilt_common.srv import LowerLegsOnFrame
from robostilt_common.srv import SetPositionRequest

# Manages a group of actuators, frames, and populates FramesState


class Frames:
    # -------------------------------------------------------------------------------------------------------  GLOBALS
    actuators_state = None
    # ---------------------------------------------------------------------------------------------------------  CALLBACKS

    def _actuator_states_callback(self, msg):
        self.actuators_state = msg
        # ---------------------------------------------------------------------------------------------------------  ROS

    def setup_ros_interface(self):
        # Variables
        rate = 50
        package_name = "actuators"
        node_name = "frames_state"
        # Node
        rospy.init_node(node_name, anonymous=False)
        self.ros_rate = rospy.Rate(rate)
        rospy.loginfo("Node robostilt/" + node_name + " started.")
        # Publishers
        # self.pub_com = rospy.Publisher(
        #    '/robostilt/'+node_name, FramesState, queue_size=1, latch=True)

        # Subscribers
        topic_name = "/robostilt/actuators_state"
        rospy.Subscriber(topic_name, ActuatorsState,
                         self._actuator_states_callback)
        # Services
        # rospy.Service('robostilt/'+node_name +
        #              '/lower_legs_on_frame',
        #              LowerLegsOnFrame,
        #              self.lower_legs_on_frame)

        # wait for...
        rospy.loginfo("Waiting for message on topic "+topic_name + " ...")
        rospy.wait_for_message(topic_name, ActuatorsState)
        rospy.loginfo("Ready...")

# ---------------------------------------------------------------------------------------------------------  INIT
    def __init__(self):
        self.actuators_state = ActuatorsState()
        self.setup_ros_interface()

# ---------------------------------------------------------------------------------------------------------  METHODS
    def get_indexes_from_frame(self, frame):
        if(frame == FramesState.NONE):
            return []
        elif(frame == FramesState.ODD):
            return [1, 3, 5]
        elif(frame == FramesState.EVEN):
            return [2, 4, 6]
        elif(frame == FramesState.PRISMATIC):
            return [0]
        elif(frame == FramesState.REVOLUTE):
            return [7]
        elif(frame == FramesState.ODD_AND_EVEN):
            return [1, 2, 3, 4, 5, 6]
        elif(frame == FramesState.PRISMATIC_AND_REVOLUTE):
            return [0, 7]
        else:
            return []

    def call_service(self, service_name, request):
        rospy.wait_for_service(service_name)
        try:
            service_type = type(request)
            service = rospy.ServiceProxy(service_name, service_type)
            result = service_type(request)
            return result
        except rospy.ServiceException, e:
            print "Service call failed: %s" % e

    def lower_legs_on_frame(self, request):
        position_request = SetPositionRequest()
        position_request.indexes = self.get_indexes_from_frame(request.frame)
        for i in range(0, len(position_request.indexes)):
            position_request.positions.append(request.position)
            position_request.velocities.append(request.velocity)
            position_request.efforts.append(request.effort)

        self.call_service(
            "robostilt/actuators_state/set_position", position_request)

        # indexes = self.get_indexes_from_frame(request.frame)

        # for i in indexes:
        #     self.actuators.actuator[i].motor.set_effort_limits(
        #         p.effort.lowering_leg_min, p.effort.lowering_leg_max)
        # indexes = frame.actuatorIndexes
        # for i in indexes:
        #     self.actuators.actuator[i].motor.set_position(
        #         p.dimension.nominal_walking_height, p.speed.lowering_legs)
        # self.actuators.wait_for_all_actuators_to_finish()

        # # We are now supported by this frame
        # self.supportingFrame = frame
        # for i in indexes:
        #     self.actuators.actuator[i].is_supporting = True

        # # update supporting legs topic
        # # We are now supported by this frame
        # self.supportingFrame = frame
        # f.print_ros("Lowering legs on frame " + frame.name + " to position " + str(
        #     p.dimension.nominal_walking_height) + " with effort_limit= " + str(limited_effort) + " COMPLETED")
        # # update supporting legs topic
        # self.update_robot_state_topic()
        # f.print_ros("Raising legs on frame " + frame.name +
        #             " to position 0.0 with effort_limit=max...")
        # indexes = frame.actuatorIndexes
        # for i in indexes:
        #     self.actuators.actuator[i].motor.set_effort_limits_to_max()
        #     self.actuators.actuator[i].motor.set_position(
        #         0.0, p.speed.raising_legs)
        #     self.actuators.actuator[i].is_supporting = False

        # # We are NOT supported by this frame at this time
        # # update supporting legs topic
        #     self.actuators.actuator[i].motor.set_effort_limits_to_max()
        #     self.actuators.actuator[i].motor.set_position(
        #         0.0, p.speed.raising_legs)
        # f.print_ros("Raising legs on frame " + frame.name +
        #             " to position 0 with effort_limit=max COMPLETED")

 # ---------------------------------------------------------------------------------------------------------  MAIN


if __name__ == '__main__':
    try:
        frames = Frames()
        while not rospy.is_shutdown():
            rospy.spin()
    except rospy.ROSInterruptException:
        pass
