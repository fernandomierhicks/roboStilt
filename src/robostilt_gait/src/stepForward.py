#! /usr/bin/env python
import rospy


from robostilt_common.robot_state import robot_state
import robostilt_common.constants as frame

 
robostilt= robot_state()

speed=0.2
effort_limit=5




def lower_legs_on_frame(frame_name):
    if(frame_name==frame.even):
        robostilt.actuator[2].motor.set_position(-0.55,speed,effort_limit)
        robostilt.actuator[4].motor.set_position(-0.55,speed,effort_limit)
        robostilt.actuator[6].motor.set_position(-0.55,speed,effort_limit)
    elif(frame_name==frame.odd):
        robostilt.actuator[1].motor.set_position(-0.8,speed,effort_limit)
        robostilt.actuator[3].motor.set_position(-0.8,speed,effort_limit)
        robostilt.actuator[5].motor.set_position(-0.8,speed,effort_limit)

def raise_legs_on_frame(frame_name):
    if(frame_name==frame.even):
        robostilt.actuator[2].motor.set_position(-0.2,speed,effort_limit)
        robostilt.actuator[4].motor.set_position(-0.2,speed,effort_limit)
        robostilt.actuator[6].motor.set_position(-0.2,speed,effort_limit)
    elif(frame_name==frame.odd):
        robostilt.actuator[1].motor.set_position(-0.2,speed,effort_limit)
        robostilt.actuator[3].motor.set_position(-0.2,speed,effort_limit)
        robostilt.actuator[5].motor.set_position(-0.2,speed,effort_limit)

def move_prismatic(position):    
        robostilt.actuator[0].motor.set_position(position,speed,effort_limit)




def step_forward():

    move_prismatic(-0.2)
    robostilt.wait_for_all_actuators_to_finish()

    lower_legs_on_frame(frame.odd)
    robostilt.wait_for_all_actuators_to_finish()

    raise_legs_on_frame(frame.even)
    robostilt.wait_for_all_actuators_to_finish()

    move_prismatic(-0.5)
    robostilt.wait_for_all_actuators_to_finish()

    lower_legs_on_frame(frame.even)
    robostilt.wait_for_all_actuators_to_finish()

    raise_legs_on_frame(frame.odd)
    robostilt.wait_for_all_actuators_to_finish()
    

if __name__ == '__main__':
    try:
        #lower_legs_on_frame(frame.even)
        #robostilt.wait_for_all_actuators_to_finish()

        #while(True):
            #step_forward()
        rospy.loginfo("done")
    except rospy.ROSInterruptException:
        pass

