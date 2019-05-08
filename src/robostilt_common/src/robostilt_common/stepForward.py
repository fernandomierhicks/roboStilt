#! /usr/bin/env python
import rospy

from constants import frame
from constants import actuator
import robot_state 
from  common import print_ros
from  common import wait_for_user

print_ros("STARTING CLASS")
robostilt=robot_state.robot_state()



speed=0.2





def lower_legs_on_frame(frame_name):
    if(frame_name==frame.even):
        robostilt.actuator[2].motor.set_position(-0.55,speed)
        robostilt.actuator[4].motor.set_position(-0.55,speed)
        robostilt.actuator[6].motor.set_position(-0.55,speed)
    elif(frame_name==frame.odd):
        robostilt.actuator[1].motor.set_position(-0.8,speed)
        robostilt.actuator[3].motor.set_position(-0.8,speed)
        robostilt.actuator[5].motor.set_position(-0.8,speed)

def raise_legs_on_frame(frame_name):
    if(frame_name==frame.even):
        robostilt.actuator[2].motor.set_position(-0.2,speed)
        robostilt.actuator[4].motor.set_position(-0.2,speed)
        robostilt.actuator[6].motor.set_position(-0.2,speed)
    elif(frame_name==frame.odd):
        robostilt.actuator[1].motor.set_position(-0.2,speed)
        robostilt.actuator[3].motor.set_position(-0.2,speed)
        robostilt.actuator[5].motor.set_position(-0.2,speed)

def move_prismatic(position):    
        robostilt.actuator[0].motor.set_position(position,speed)

def step_forward():
    #Move Forward
    print_ros("Forward...")
    wait_for_user()
    robostilt.set_effort_limit_to_max_on_frame(frame.third_prismatic,)
    move_prismatic(-0.2)
    robostilt.wait_for_all_actuators_to_finish()

    
    #Lower legs on ODD 
    print_ros("Lowering ODD...")
    wait_for_user()
    robostilt.set_effort_limit_on_frame(frame.odd,0,100)
    lower_legs_on_frame(frame.odd)
    robostilt.wait_for_all_actuators_to_finish()

    
    #Raise legs on even
    print_ros("Raise EVEN...")
    wait_for_user()
    robostilt.set_effort_limit_to_max_on_frame(frame.even)
    raise_legs_on_frame(frame.even)
    robostilt.wait_for_all_actuators_to_finish()

    
    #Move Forward
    print_ros("Forward...")
    wait_for_user()
    robostilt.set_effort_limit_to_max_on_frame(frame.third_prismatic,)
    move_prismatic(-0.5)
    robostilt.wait_for_all_actuators_to_finish()
    
    
    #Lower legs on EVEN
    print_ros("Lower Even...")
    wait_for_user()
    robostilt.set_effort_limit_on_frame(frame.even,0,100)
    lower_legs_on_frame(frame.even)
    robostilt.wait_for_all_actuators_to_finish()
    

    #Raise legs on ODD
    print_ros("Raise ODD...")
    wait_for_user()
    robostilt.set_effort_limit_to_max_on_frame(frame.odd)
    raise_legs_on_frame(frame.odd)
    robostilt.wait_for_all_actuators_to_finish()

def init_position():
        print_ros("Initializing position. Lower legs on even, raise legs on odd, prismatic to -0.5...")
        wait_for_user()
        robostilt.set_effort_limit_to_max_on_frame(frame.even)
        lower_legs_on_frame(frame.even)

        robostilt.set_effort_limit_to_max_on_frame(frame.odd)
        raise_legs_on_frame(frame.odd)

        robostilt.set_effort_limit_to_max_on_frame(frame.third_prismatic)
        move_prismatic(-0.5)

        robostilt.wait_for_all_actuators_to_finish()
        print_ros("Init COMPLETE")

if __name__ == '__main__':
    try:        
        init_position()
        while(True):
            step_forward()
        print_ros("Done with stepForward")

    except rospy.ROSInterruptException:
        pass

