#! /usr/bin/env python

import rospy

import actionlib 

from control_msgs.msg import FollowJointTrajectoryGoal
from control_msgs.msg import FollowJointTrajectoryAction
from sensor_msgs.msg  import JointState 
from trajectory_msgs.msg import JointTrajectory
from trajectory_msgs.msg import JointTrajectoryPoint



# CONSTANTS
FRAME_THIRD_PRISMATIC=0
FRAME_ODD=1
FRAME_EVEN=2
FRAME_THIRD_REVOLUTE=3

actuatorName = {
        0: "third_frame_prismatic",
        1: "leg_1",
        2: "leg_2",
        3: "leg_3",
        4: "leg_4",
        5: "leg_5",
        6: "leg_6",
        7: "third_frame_revolute"
    }

class robot_state:
    #Global variables
    actuator=[]
    rate = None

      

    def __init__(self):
        rospy.init_node('robostilt_master_node', anonymous=True) # allows multiple instances of the master_node        
        self.rate=rospy.Rate(100) # 100hz                
        #8 actuators
        for i in range(0, 8): 
            self.actuator.append(Actuator(actuatorName.get(i)))   
            self.actuator[i].motor.effort_limit=-100 
        #initialize nodes
        rospy.Subscriber("/robostilt/joint_states", JointState, self._JoinstState_callback)
        #send all motors to their current position to reset the actionClient
        self.init_motors()
        

    def _JoinstState_callback(self, data):
        #Maps positions from joint_states to current_position that has same indexes as controllers
        #Joint_states publishes joints in alphabetical order leg1-6, prismatic, revolute

            self.actuator[0].motor.position= data.position[6] 
            self.actuator[0].motor.effort= data.effort[6]

            for i in range(0, 7): 
                self.actuator[i+1].motor.effort = data.effort[i]#legs
                self.actuator[i+1].motor.effort = data.effort[i]#legs

            self.actuator[7].motor.position = data.position[7]
            self.actuator[7].motor.effort = data.effort[7]
            
            #Stop if we exceed torque limit
            for i in range(0,8):
                if(self.actuator[i].motor.effort_limit>0): #in case we havent initialized
                    if(abs(self.actuator[i].motor.effort)>self.actuator[i].motor.effort_limit):
                        i=5                    
                        #self.actuator[i].motor.stop()



    
    def have_all_actuators_reached_goal(self):
        result=True
        for i in range(0 ,7):
            if(self.actuator[i].motor.has_reached_goal==False):
                result=False
                break
        return result

    def wait_for_all_actuators_to_finish(self):
       
        while(self.have_all_actuators_reached_goal()==False):
            self.rate.sleep()

    def init_motors(self):
        #send all motors to their current position to reset the actionClient
        #wait for valid position from joint_states
        rate = rospy.Rate(100) # 100hz    
        while(self.actuator[0].motor.position==None):
            self.rate.sleep()
        #valid position on motors
        for i in range(0 ,7):            
            self.actuator[i].motor.assert_position()
        self.wait_for_all_actuators_to_finish()
        rospy.loginfo("Done initializing motors")
            

class Motor:    
    name= None
    actionClient=None 
    position = None
    velocity = None
    effort = None
    effort_limit= None
    is_moving= None
    has_reached_goal=None

    def __init__(self,name):
        self.name=name
        controller_name="/robostilt/"+self.name+"_trajectory_controller/follow_joint_trajectory"

        self.actionClient=actionlib.SimpleActionClient(controller_name, FollowJointTrajectoryAction)

        self.actionClient.wait_for_server()
        #rospy.loginfo("Action client ready " + self.name )

    def set_position(self, position_setpoint, speed_limit, effort_limit):
        self.effort_limit=effort_limit
        #set up variables
        trajectory = JointTrajectory()
        point = JointTrajectoryPoint()
        #Final position
        point.positions = [position_setpoint]
        trajectory.points.append(point)
        #How long to get there
        time=abs(self.position-position_setpoint)/speed_limit
        trajectory.points[0].time_from_start=rospy.Duration(time)
        #specify which joint to move
        trajectory.joint_names.append(self.name)
        #send trajectory
        follow_trajectory_goal = FollowJointTrajectoryGoal()
        follow_trajectory_goal.trajectory = trajectory   
        #send goal and register callback when done 
        self.actionClient.send_goal(follow_trajectory_goal,done_cb=self._goal_done)

        #log info
        rospy.loginfo(trajectory.joint_names[0] + " new position set to: " + str(position_setpoint) +" old position is: " + str(self.position)+ " allowed time is is: " +str(time))
        self.is_moving=True  
        self.has_reached_goal=False 

    def stop(self):
        #set up variables
        self.effort_limit=100        
        self.actionClient.cancel_all_goals()        
        #log info
        rospy.loginfo(self.name + " STOPPED")
        self.is_moving=False 
        self.has_reached_goal=True

    def assert_position(self):
        #set limit
        self.effort_limit=100
        #set up variables
        trajectory = JointTrajectory()
        point = JointTrajectoryPoint()
        #Final position
        point.positions = [self.position]
        trajectory.points.append(point)
        #How long to get there        
        trajectory.points[0].time_from_start=rospy.Duration(0.1)
        #specify which joint to move
        trajectory.joint_names.append(self.name)
        #send trajectory
        follow_trajectory_goal = FollowJointTrajectoryGoal()
        follow_trajectory_goal.trajectory = trajectory   
        #send goal and register callback when done 
        self.actionClient.send_goal(follow_trajectory_goal,done_cb=self._goal_done)
        #log info
        rospy.loginfo(trajectory.joint_names[0] + " asserted...")
        self.is_moving=True  
        self.has_reached_goal=False
      
    def _goal_done(self,state, result):
        #Triggers when action is completed       
        if(result.error_code==0):
                rospy.loginfo(self.name +" has reached goal. Pos= "+ str(self.position))
                #reset client
                self.actionClient.cancel_all_goals()
                self.actionClient.stop_tracking_goal()  
                self.is_moving=False  
                self.has_reached_goal=True              
        else:
                rospy.logerr(self.name +" FAILED to reach goal.")
                #double_print(getErrorInHumanReadableStr(result.error_code))
                #double_print(result.error_string)        
        


class Actuator:
    name= None
    motor = None
    has_been_homed=None

    def __init__(self,name):
         self.name=name
         self.motor=Motor(self.name)
   
    

    