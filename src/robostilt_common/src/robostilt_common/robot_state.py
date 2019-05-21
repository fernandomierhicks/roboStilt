#! /usr/bin/env python
import rospy
import actuators_state 
import tf
import functions as f
from geometry_msgs.msg import QuaternionStamped

import parameters as p
from constants import constants as C
from robostilt_common.msg import RoboStiltStateMessage


class robot_state:
    actuators=None
    supportingFrame=C.FRAME.NONE    
    publisher=None
    roll_x=None
    pitch_y=None
    yaw_z=None
    rate=None

    def __init__(self):        
        f.print_ros("Robot_state setup started")
        #start robot_state node and topic publisher
        self.publisher = rospy.Publisher('/robostilt/general_state_topic', RoboStiltStateMessage,queue_size=1, latch=True)
        rospy.init_node('robostilt_state_publisher', anonymous=True)
        rospy.Subscriber("/robostilt/safety/level", QuaternionStamped, self._level_callback)  
        self.rate=rospy.Rate(50)  
        self.actuators=actuators_state.actuators_state()  
        p.read_from_parameter_server()           
        f.print_ros("Robot_state setup completed")

    def _level_callback(self, msg):
            orientation_q = msg.quaternion            
            #Calculate euler angles
            orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
            (self.roll_x, self.pitch_y, self.yaw_z) = tf.transformations.euler_from_quaternion (orientation_list) 
            #rospy.loginfo(self.roll_x)

    def raise_frame_while_leveling(self,position):
        #move lonely leg normally, leg_2 or leg_5. Move other legs to their max displacement, will abort once lonely leg reaches goal
        frame=C.FRAME.EVEN
        f.print_ros("Raising frame " + frame.name +" to position " +str(position) + " ...")        
        indexes=frame.actuatorIndexes
        speed=0.1
        level_thereshold=0.0174533
        
        for i in indexes:            
            self.actuators.actuator[i].motor.set_effort_limits_to_max()

        if(frame.name==C.FRAME.EVEN.name):
            lonely_leg=2

        self.actuators.actuator[lonely_leg].motor.set_position(position,speed)

        self.actuators.actuator[4].motor.set_position(-2.0,speed)
        self.actuators.actuator[6].motor.set_position(-2.0,speed)

        while( self.actuators.have_all_actuators_reached_goal()==False):            
            self.rate.sleep()

            if(self.roll_x>level_thereshold):
                 self.actuators.actuator[6].motor.set_position(-2.0,speed*1.5)
                 f.print_ros("Increasing speed")
            elif(self.roll_x<-1*level_thereshold):
                self.actuators.actuator[6].motor.set_position(-2.0,speed*0.5)
                f.print_ros("reducing speed")
            else:
                self.actuators.actuator[6].motor.set_position(-2.0,speed)
                f.print_ros("normal speed")

            #check if lonely leg is done
            if (self.actuators.actuator[2].motor.has_reached_goal==True):
                self.actuators.actuator[4].motor.stop()
                self.actuators.actuator[6].motor.stop()
                f.print_ros("done with leg 2")
                break 
        self.actuators.wait_for_all_actuators_to_finish()


    def lower_legs_on_frame(self,frame,limited_effort):
        f.print_ros("Lowering legs on frame " + frame.name +" to position " +str(p.dimension.nominal_walking_height)+ " with effort_limit= " + str(limited_effort)+ " ...")

        indexes=frame.actuatorIndexes
        for i in indexes:
            if(limited_effort==True):  
                self.actuators.actuator[i].motor.set_effort_limits(p.effort.lowering_leg_min,p.effort.lowering_leg_max)   
            else:
                self.actuators.actuator[i].motor.set_effort_limits_to_max()
            self.actuators.actuator[i].motor.set_position(p.dimension.nominal_walking_height,p.speed.lowering_legs)
        self.actuators.wait_for_all_actuators_to_finish()

        #We are now supported by this frame
        self.supportingFrame=frame
        for i in indexes:
            self.actuators.actuator[i].is_supporting=True       

        #update supporting legs topic
        self.update_robot_state_topic()


        f.print_ros("Lowering legs on frame " + frame.name +" to position " +str(p.dimension.nominal_walking_height)+ " with effort_limit= " + str(limited_effort) +" COMPLETED")
            

    def raise_legs_on_frame(self, frame):
        f.print_ros("Raising legs on frame " + frame.name + " to position 0.0 with effort_limit=max...")
        indexes=frame.actuatorIndexes
        for i in indexes:
            self.actuators.actuator[i].motor.set_effort_limits_to_max()            
            self.actuators.actuator[i].motor.set_position(0.0,p.speed.raising_legs)
            self.actuators.actuator[i].is_supporting=False

        #We are NOT supported by this frame at this time
        #update supporting legs topic
        self.update_robot_state_topic()

        self.actuators.wait_for_all_actuators_to_finish()
        f.print_ros("Raising legs on frame " + frame.name + " to position 0 with effort_limit=max COMPLETED")

    def move_prismatic(self,position):
            f.print_ros("Moving third frame Prismatic to " + str(position) + "...")
            i=C.ACTUATOR.third_frame_prismatic.index            
            self.actuators.actuator[i].motor.set_effort_limits_to_max() 
            self.actuators.actuator[i].motor.set_position(position,p.speed.prismatic)
            self.actuators.wait_for_all_actuators_to_finish()
            f.print_ros("Moving third frame Prismatic to " + str(position) + " COMPLETED")

    def move_actuator(self,actuator_index,position):
            f.print_ros("Moving "+str(C.ACTUATOR.getNameFromIndex(actuator_index))+"  to " + str(position) + "...")
            i=actuator_index            
            self.actuators.actuator[i].motor.set_effort_limits_to_max() 
            self.actuators.actuator[i].motor.set_position(position,p.speed.lowering_legs)
            self.actuators.wait_for_all_actuators_to_finish()
            f.print_ros("Moving "+str(C.ACTUATOR.getNameFromIndex(actuator_index))+"  to " + str(position) + "COMPLETED")
    
    def update_robot_state_topic(self):
        msg = RoboStiltStateMessage()
        msg.header.stamp=rospy.Time.now()
        msg.name=[]
        msg.is_supporting=[]
        for i in range (0, C.ACTUATOR.count):
            msg.name.append(C.ACTUATOR.getNameFromIndex(i))
            msg.is_supporting.append(self.actuators.actuator[i].is_supporting) 
        self.publisher.publish(msg)

    def step_forward(self):
        #Move Forward        
        f.wait_for_user()
        self.move_prismatic(-0.2)
        
        #Lower legs on ODD        
        f.wait_for_user()
        self.lower_legs_on_frame(C.FRAME.ODD,True)

        #Raise legs on even        
        f.wait_for_user()        
        self.raise_legs_on_frame(C.FRAME.EVEN)
        
        #Move Forward
        f.wait_for_user()       
        self.move_prismatic(-0.5)     
        
        #Lower legs on EVEN
        f.wait_for_user()        
        self.lower_legs_on_frame(C.FRAME.EVEN, True)        

        #Raise legs on ODD       
        f.wait_for_user()        
        self.raise_legs_on_frame(C.FRAME.ODD)


    def init_position(self):
            f.print_ros("Initializing position. Lower legs on even, raise legs on odd, prismatic to -0.5...")
            f.wait_for_user()  
            self.lower_legs_on_frame(C.FRAME.EVEN,False)
            self.raise_legs_on_frame(C.FRAME.ODD)
            self.move_prismatic(-0.5)
            self.actuators.wait_for_all_actuators_to_finish()
            f.print_ros("Initial position COMPLETED")



