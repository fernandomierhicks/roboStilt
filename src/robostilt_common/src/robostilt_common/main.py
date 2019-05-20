#! /usr/bin/env python
import rospy
import robot_state 
import functions as f

f.print_ros("Main starting...")
robostilt=robot_state.robot_state()    


robostilt.init_position()


#robostilt.move_actuator(4,0.0) # fall on purpose

while(True):
    robostilt.step_forward()

#f.print_ros("Done with stepForward")

