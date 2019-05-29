#! /usr/bin/env python
import rospy
from robostilt_common.msg import *
from robostilt_common.srv import *

# Manages a group of actuators, frames, and populates FramesState


class EffortLimit():
    upper = None
    lower = None
    name = None

    def __init__(self, name):
        self.upper = rospy.get_param("robostilt/"+name+"/efforts/upper")
        self.lower = rospy.get_param("robostilt/"+name+"/efforts/lower")
        self.name = name

        if(self.upper < self.lower):
            self.lower, self.upper = self.upper, self.lower
            rospy.loginfo(
                name + " effort limits are swapped, automatically correcting.")


class Frames:
    # -------------------------------------------------------------------------------------------------------  GLOBALS
    actuators_state = None
    publisher = None
    frames_state = None
    supporting_frame = None
    ready_to_move = None
    # ---------------------------------------------------------------------------------------------------------  CALLBACKS

    def _actuator_states_callback(self, msg):
        self.actuators_state = msg
        self.frames_state.header.stamp = rospy.Time.now()
        self.frames_state.supporting_frame = self.supporting_frame
        self.publisher.publish(self.frames_state)

    def _robot_state_callback(self, msg):
        # only allow to move if we are not faulted
        if(msg.state != RobotState.STATE_FAULTED):
            self.ready_to_move = True
        else:
            self.ready_to_move = False
        # ---------------------------------------------------------------------------------------------------------  ROS

    def setup_ros_interface(self):
        # Variables
        rate = rospy.get_param("/robostilt/rate")
        package_name = "actuators"
        node_name = "frames_state"
        # Node
        rospy.init_node(node_name, anonymous=False)
        self.ros_rate = rospy.Rate(rate)
        rospy.loginfo("Node robostilt/" + node_name + " started.")
        # Publishers
        self.publisher = rospy.Publisher(
            '/robostilt/'+node_name, FramesState, queue_size=1, latch=True)

        # Subscribers
        topic_name = "/robostilt/robot_state"
        rospy.Subscriber(topic_name,
                         RobotState, self._robot_state_callback)

        topic_name = "/robostilt/actuators_state"
        rospy.Subscriber(topic_name, ActuatorsState,
                         self._actuator_states_callback)
        # Services
        self.setup_services(node_name)

        # wait for...
        rospy.loginfo("Waiting for message on topic "+topic_name + " ...")
        rospy.wait_for_message(topic_name, ActuatorsState)
        rospy.loginfo(node_name + " ready...")

    def setup_services(self, node_name):
        prefix = "robostilt/"+node_name

        rospy.Service(prefix+'/lower_legs_on_frame',
                      LowerLegsOnFrame,
                      self.lower_legs_on_frame)

        rospy.Service(prefix+'/raise_frame',
                      RaiseFrame,
                      self.raise_frame)

        rospy.Service(prefix+'/move_prismatic',
                      MovePrismatic,
                      self.move_prismatic)

        rospy.Service(prefix+'/raise_legs_on_frame',
                      RaiseLegsOnFrame,
                      self.raise_legs_on_frame)

# ---------------------------------------------------------------------------------------------------------  INIT
    def __init__(self):

        self.actuators_state = ActuatorsState()
        self.frames_state = FramesState()
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

    def call_service(self, service_name, service_type, request):
        rospy.wait_for_service(service_name)
        try:
            service = rospy.ServiceProxy(service_name, service_type)
            result = service(request)
            return result
        except rospy.ServiceException, e:
            print "Service call failed: %s" % e

    def set_supporting_legs(self, indexes, is_supporting):

        for i in indexes:
            self.frames_state.supporting_legs

        # order list
        self.supporting_legs.sort()

    def create_position_request_from_parameter_name(self, name, frame, absolute, position, effort_fault_expected):
        position_request = SetPositionRequest()
        position_request.indexes = self.get_indexes_from_frame(frame)
        effort_limits = EffortLimit(name)
        velocity = rospy.get_param("robostilt/"+name+"/velocity")

        for i in range(0, len(position_request.indexes)):
            position_request.absolute.append(absolute)
            position_request.positions.append(position)
            position_request.velocities.append(velocity)
            position_request.efforts_limit_upper.append(effort_limits.upper)
            position_request.efforts_limit_lower.append(effort_limits.lower)
            position_request.effort_fault_expected.append(
                effort_fault_expected)

        return position_request

    def are_we_are_ready_to_move(self, string_message):
        if(self.ready_to_move is True):
            return True
        else:
            rospy.logerr("Attempted to move while faulted: " + string_message)
        return False

    def move_prismatic(self, request):
        name = "moving_prismatic"
        if(self.are_we_are_ready_to_move(name) is True):
            effort_fault_expected = False
            absolute = ActuatorsState.ABS
            position_request = self.create_position_request_from_parameter_name(
                name, request.frame, absolute, request.position, effort_fault_expected)

            position_result = self.call_service(
                "robostilt/actuators_state/set_position", SetPosition, position_request)

            if (position_result.success == True):
                return MovePrismaticResponse(True)
            else:
                rospy.logerr(
                    "Service call to set_position failed while processing "+name)

        return MovePrismaticResponse(False)

    def raise_legs_on_frame(self, request):

        name = "raising_legs"
        if(self.are_we_are_ready_to_move(name) is True):
            effort_fault_expected = False
            absolute = ActuatorsState.ABS
            position_request = self.create_position_request_from_parameter_name(
                name, request.frame, absolute, request.position, effort_fault_expected)

            position_result = self.call_service(
                "robostilt/actuators_state/set_position", SetPosition, position_request)

            if (position_result.success == True):
                return RaiseLegsOnFrameResponse(True)
            else:
                rospy.logerr(
                    "Service call to set_position failed while processing "+name)
        return RaiseLegsOnFrameResponse(False)

    def lower_legs_on_frame(self, request):
        name = "lowering_legs"
        if(self.are_we_are_ready_to_move(name) is True):
            effort_fault_expected = True
            absolute = ActuatorsState.ABS
            position_request = self.create_position_request_from_parameter_name(
                name, request.frame, absolute, request.position, effort_fault_expected)

            position_result = self.call_service(
                "robostilt/actuators_state/set_position", SetPosition, position_request)

            if (position_result.success == True):
                return LowerLegsOnFrameResponse(True)
            else:
                rospy.logerr(
                    "Service call to set_position failed while processing "+name)

        return LowerLegsOnFrameResponse(False)

    def raise_frame(self, request):
        name = "raising_frame"
        if(self.are_we_are_ready_to_move(name) is True):
            effort_fault_expected = False
            relative = ActuatorsState.REL
            position_request = self.create_position_request_from_parameter_name(
                name, request.frame, relative, request.position, effort_fault_expected)

            position_result = self.call_service(
                "robostilt/actuators_state/set_position", SetPosition, position_request)

            if (position_result.success == True):
                return RaiseFrameResponse(True)
            else:
                rospy.logerr(
                    "Service call to set_position failed while processing " + name)
        return RaiseFrameResponse(False)
 # ---------------------------------------------------------------------------------------------------------  MAIN


if __name__ == '__main__':
    try:
        frames = Frames()
        while not rospy.is_shutdown():
            rospy.spin()
    except rospy.ROSInterruptException:
        pass
