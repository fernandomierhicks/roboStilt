#! /usr/bin/env python
import rospy

from robostilt_common.robot_state import robot_state
import robostilt_common.constants as frame

import robostilt_common.
 
robostilt= robot_state()

speed=0.2

constants.



def lower_legs_on_frame(frame_name):
    if(frame_name==):
        robostilt.actuator[2].motor.set_position(-0.55,speed)
        robostilt.actuator[4].motor.set_position(-0.55,speed)
        robostilt.actuator[6].motor.set_position(-0.55,speed)
    elif(frame_name==):
        robostilt.actuator[1].motor.set_position(-0.8,speed)
        robostilt.actuator[3].motor.set_position(-0.8,speed)
        robostilt.actuator[5].motor.set_position(-0.8,speed)

def raise_legs_on_frame(frame_name):
    if(frame_name==):
        robostilt.actuator[2].motor.set_position(-0.2,speed)
        robostilt.actuator[4].motor.set_position(-0.2,speed)
        robostilt.actuator[6].motor.set_position(-0.2,speed)
    elif(frame_name==):
        robostilt.actuator[1].motor.set_position(-0.2,speed)
        robostilt.actuator[3].motor.set_position(-0.2,speed)
        robostilt.actuator[5].motor.set_position(-0.2,speed)

def step_forward():

    lower_legs_on_frame()
    robostilt.wait_for_all_actuators_to_finish()

    

if __name__ == '__main__':
    try:
        
    except rospy.ROSInterruptException:
        pass

