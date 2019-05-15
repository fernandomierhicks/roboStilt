#! /usr/bin/env python
import rospy
import robot_state 
from  common import print_ros
from  common import wait_for_user

print_ros("Main starting...")
robostilt=robot_state.robot_state()    


robostilt.init_position()

while(True):
    robostilt.step_forward()
#print_ros("Done with stepForward")

