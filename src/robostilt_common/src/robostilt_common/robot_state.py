#! /usr/bin/env python
import rospy
from constants import frame
from constants import actuator
import actuators_state 
from  common import print_ros
from  common import wait_for_user
import parameters as p





class robot_state:
    actuators=None


    def __init__(self):
        
        print_ros("Robot_state setup started")
        self.actuators=actuators_state.actuators_state()  
        p.read_from_parameter_server()           
        print_ros("Robot_state setup completed")

    def lower_legs_on_frame(self,frame_name):
        if(frame_name==frame.even):            
            self.actuators.actuator[2].motor.set_position(p.dimension.nominal_walking_height,p.speed.lowering_legs)
            self.actuators.actuator[4].motor.set_position(p.dimension.nominal_walking_height,p.speed.lowering_legs)
            self.actuators.actuator[6].motor.set_position(p.dimension.nominal_walking_height,p.speed.lowering_legs)
        elif(frame_name==frame.odd):
            self.actuators.actuator[1].motor.set_position(p.dimension.nominal_walking_height,p.speed.lowering_legs)
            self.actuators.actuator[3].motor.set_position(p.dimension.nominal_walking_height,p.speed.lowering_legs)
            self.actuators.actuator[5].motor.set_position(p.dimension.nominal_walking_height,p.speed.lowering_legs)

    def raise_legs_on_frame(self, frame_name):
        if(frame_name==frame.even):
            self.actuators.actuator[2].motor.set_position(-0.0,p.speed.raising_legs)
            self.actuators.actuator[4].motor.set_position(-0.0,p.speed.raising_legs)
            self.actuators.actuator[6].motor.set_position(-0.0,p.speed.raising_legs)
        elif(frame_name==frame.odd):
            self.actuators.actuator[1].motor.set_position(-0.0,p.speed.raising_legs)
            self.actuators.actuator[3].motor.set_position(-0.0,p.speed.raising_legs)
            self.actuators.actuator[5].motor.set_position(-0.0,p.speed.raising_legs)

    def move_prismatic(self,position):    
            self.actuators.actuator[0].motor.set_position(position,p.speed.prismatic)

    def step_forward(self):
        #Move Forward
        print_ros("Forward...")
        wait_for_user()
        self.actuators.set_effort_limit_to_max_on_frame(frame.third_prismatic,)
        self.move_prismatic(-0.2)
        self.actuators.wait_for_all_actuators_to_finish()

        
        #Lower legs on ODD 
        print_ros("Lowering ODD...")
        wait_for_user()
        self.actuators.set_effort_limit_on_frame(frame.odd,0,100)
        self.lower_legs_on_frame(frame.odd)
        self.actuators.wait_for_all_actuators_to_finish()
        #update supporting legs

        
        #Raise legs on even
        print_ros("Raise EVEN...")
        wait_for_user()
        self.actuators.set_effort_limit_to_max_on_frame(frame.even)
        self.raise_legs_on_frame(frame.even)
        self.actuators.wait_for_all_actuators_to_finish()

        
        #Move Forward
        print_ros("Forward...")
        wait_for_user()
        self.actuators.set_effort_limit_to_max_on_frame(frame.third_prismatic,)
        self.move_prismatic(-0.5)
        self.actuators.wait_for_all_actuators_to_finish()
        
        
        #Lower legs on EVEN
        print_ros("Lower Even...")
        wait_for_user()
        self.actuators.set_effort_limit_on_frame(frame.even,0,100)
        self.lower_legs_on_frame(frame.even)
        self.actuators.wait_for_all_actuators_to_finish()
        

        #Raise legs on ODD
        print_ros("Raise ODD...")
        wait_for_user()
        self.actuators.set_effort_limit_to_max_on_frame(frame.odd)
        self.raise_legs_on_frame(frame.odd)
        self.actuators.wait_for_all_actuators_to_finish()

    def init_position(self):
            print_ros("Initialize position. Lower legs on even, raise legs on odd, prismatic to -0.5...")
            wait_for_user()

            self.actuators.set_effort_limit_to_max_on_frame(frame.even)
            self.lower_legs_on_frame(frame.even)

            self.actuators.set_effort_limit_to_max_on_frame(frame.odd)
            self.raise_legs_on_frame(frame.odd)

            self.actuators.set_effort_limit_to_max_on_frame(frame.third_prismatic)
            self.move_prismatic(-0.5)

            self.actuators.wait_for_all_actuators_to_finish()
            print_ros("Initial position complete")
            wait_for_user()


