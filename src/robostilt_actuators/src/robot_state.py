#! /usr/bin/env python

import rospy
from robostilt_common.srv import *
from robostilt_common.msg import *


class Robot:
    # -------------------------------------------------------------------------------------------------------  GLOBALS
    all_actuators_ready = False
    publisher = None
    ready_to_move = None
    # ---------------------------------------------------------------------------------------------------------  CALLBACKS

    def _actuator_states_callback(self, msg):
        self.all_actuators_ready = msg.all_are_ready
    # ---------------------------------------------------------------------------------------------------------  ROS

    def setup_ros_interface(self):
        # Variables
        rate = 50
        package_name = "actuators"
        node_name = "robot_state"
        # Node
        rospy.init_node(node_name, anonymous=False)
        self.ros_rate = rospy.Rate(rate)
        rospy.loginfo("Node robostilt/" + node_name + " started.")
        # Publishers
        self.publisher = rospy.Publisher(
            '/robostilt/'+node_name, RobotState, queue_size=1, latch=True)

        # Subscribers
        topic_name = "/robostilt/actuators_state"
        rospy.Subscriber(topic_name, ActuatorsState,
                         self._actuator_states_callback)
        # Services
        prefix = "robostilt/"+node_name
        rospy.Service(prefix+'/trigger_fault',
                      TriggerFault,
                      self.trigger_fault)
        # wait for...
        rospy.loginfo("Waiting for message on topic "+topic_name + " ...")
        rospy.wait_for_message(topic_name, ActuatorsState)
        rospy.loginfo("Ready...")
    
    def publish_robot_state(self, state,fault):
            message = RobotState()
            message.fault = fault
            message.state = state
            message.state_string=self.get_state_string(state)
            message.fault_string=self.get_state_string(fault) 
            self.publisher.publish(message)

# ---------------------------------------------------------------------------------------------------------  INIT
    def __init__(self):
        self.setup_ros_interface()
        # publish initial state as ready        
        self.publish_robot_state(RobotState.STATE_READY,RobotState.FAULT_CLEAR)
        self.ready_to_move=True
        rospy.sleep(1.0)

# ---------------------------------------------------------------------------------------------------------  METHODS
    def get_frame_name(self, frame):
        if(frame == FramesState.NONE):
            return "NONE"
        elif(frame == FramesState.ODD):
            return "ODD"
        elif(frame == FramesState.EVEN):
            return "EVEN"
        elif(frame == FramesState.PRISMATIC):
            return "PRISMATIC"
        elif(frame == FramesState.REVOLUTE):
            return "REVOLUTE"
        elif(frame == FramesState.ODD_AND_EVEN):
            return "ODD AND EVEN"
        elif(frame == FramesState.PRISMATIC_AND_REVOLUTE):
            return "PRISMATIC AND REVOLUTE"
        else:
            return "UNKNOWN"

    def get_fault_code_string(self, fault):
        if(fault == RobotState.FAULT_CLEAR):
            return "CLEAR"
        elif(fault == RobotState.FAULT_ESTOP):
            return "ESTOP"
        elif(fault == RobotState.FAULT_EFFORT):
            return "EFFORT"
        elif(fault == RobotState.FAULT_TRAJECTORY):
            return "TRAJECTORY"
        else:
            return "UNKNOWN"

    def get_state_string(self, state):
        if(state == RobotState.STATE_READY):
            return "READY"
        elif(state == RobotState.STATE_FAULTED):
            return "FAULTED"
        elif(state == RobotState.STATE_BUSY_MOVING):
            return "BUSY MOVING"
        elif(state == RobotState.STATE_BUSY_COMPUTING):
            return "BUSY COMPUTING"
        else:
            return "UNKNOWN"

    def call_service(self, service_name, service_type, request):
        rospy.wait_for_service(service_name)
        try:
            service = rospy.ServiceProxy(service_name, service_type)
            result = service(request)
            return result
        except rospy.ServiceException, e:
            print "Service call failed: %s" % e

    def trigger_fault(self, request):
        if(request.fault_code == RobotState.FAULT_CLEAR):
            rospy.loginfo("Faults cleared")
            #Do clearing            
            self.publish_robot_state(RobotState.STATE_READY, RobotState.FAULT_CLEAR)
            self.ready_to_move=True
            return TriggerFaultResponse(True)
        else:
            rospy.logerr("Fault triggered: " + self.get_fault_code_string(request.fault_code))
            service_name = "robostilt/actuators_state/stop_all"
            stop_all_request = StopAllRequest()            
            response=self.call_service(service_name, StopAll, stop_all_request)
            self.publish_robot_state(RobotState.STATE_FAULTED,request.fault_code)
            self.ready_to_move=False
            return TriggerFaultResponse(response.success)
    
    def are_we_are_ready_to_move(self,string_message):
        if(self.ready_to_move is True):
            return True
        else:
            rospy.logerr("Attempted to move while faulted: " +string_message)
        return False


    def raise_frame(self, frame, position):
        name="Raising frame "
        if(self.are_we_are_ready_to_move(name) is True):
            rospy.loginfo(name +
                        self.get_frame_name(frame) + " started...")
            request = RaiseFrameRequest()
            request.frame = frame
            request.position = position
            result = self.call_service(
                "robostilt/frames_state/raise_frame", RaiseFrame, request)

            wait_result = self.wait_for_all_actuators_to_be_ready()

            if (result.success is True and wait_result is True):
                rospy.loginfo("Raising frame " +
                            self.get_frame_name(frame) + " completed.")

    def lower_legs_on_frame(self, frame, position):
        name="Lowering legs on frame "
        if(self.are_we_are_ready_to_move(name) is True):
            rospy.loginfo(name +
                        self.get_frame_name(frame) + " started...")

            request = LowerLegsOnFrameRequest()
            request.frame = frame
            request.position = position
            result = self.call_service(
                "robostilt/frames_state/lower_legs_on_frame", LowerLegsOnFrame, request)

            wait_result = self.wait_for_all_actuators_to_be_ready()

            if (result.success is True and wait_result is True):
                rospy.loginfo("Lowering legs on frame " +
                            self.get_frame_name(frame) + " completed.")

    def raise_legs_on_frame(self, frame, position):
        name="Raising legs on frame "
        if(self.are_we_are_ready_to_move(name) is True):
            rospy.loginfo(name +
                        self.get_frame_name(frame) + " started...")

            request = RaiseLegsOnFrameRequest()
            request.frame = frame
            request.position = position
            result = self.call_service(
                "robostilt/frames_state/raise_legs_on_frame", RaiseLegsOnFrame, request)

            wait_result = self.wait_for_all_actuators_to_be_ready()

            if (result.success is True and wait_result is True):
                rospy.loginfo("Raising legs on frame " +
                            self.get_frame_name(frame) + " completed.")

    def move_prismatic(self, frame, position):
        name = "Moving frame "
        if(self.are_we_are_ready_to_move(name) is True):
            rospy.loginfo(name +
                        self.get_frame_name(frame) + " started...")
            request = MovePrismaticRequest()
            request.frame = frame
            request.position = position
            result = self.call_service(
                "robostilt/frames_state/move_prismatic", MovePrismatic, request)

            wait_result = self.wait_for_all_actuators_to_be_ready()

            if (result.success is True and wait_result is True):
                rospy.loginfo("Moving frame " +
                            self.get_frame_name(frame) + " completed.")

    def wait_for_all_actuators_to_be_ready(self):
        # flag hasnt been updated by other nodes, give a little bit of time
        if(self.all_actuators_ready == True):
            rospy.sleep(0.2)
        while(self.all_actuators_ready != True):
            rospy.sleep(0.01)
            if(self.ready_to_move is False):
                return False

        rospy.sleep(0.3)
        return True

    def step_forward(self):
        self.move_prismatic(FramesState.PRISMATIC, -0.2)
        self.lower_legs_on_frame(FramesState.ODD, -1.5)
        self.raise_legs_on_frame(FramesState.EVEN, 0.0)
        self.move_prismatic(FramesState.PRISMATIC, -0.5)
        self.lower_legs_on_frame(FramesState.EVEN, -1.5)
        self.raise_legs_on_frame(FramesState.ODD, 0.0)


    # ---------------------------------------------------------------------------------------------------------  MAIN


if __name__ == '__main__':
    try:
        robot_state = Robot()

        # raise Frame Even.
        robot_state.raise_frame(FramesState.EVEN, -1.0)
        

        while(True):
            robot_state.step_forward()
        
        rospy.loginfo("Done")
        while not rospy.is_shutdown():
            rospy.spin()
    except rospy.ROSInterruptException:
        pass
