#! /usr/bin/env python
import rospy
import robot_state 
from constants import constants as C
from functions import print_ros

print_ros("Main starting...")
robostilt=robot_state.robot_state()  
robostilt.set_initial_state()
#robostilt.lower_legs_on_frame(C.FRAME.EVEN,False)

robostilt.move_actuator(4,-0.2) #fall on purpose
robostilt.raise_frame_while_leveling(-1.0)
# while(True):
#     robostilt.step_forward()
# #print_ros("Done with stepForward")

rospy.spin()
