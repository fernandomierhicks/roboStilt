#! /usr/bin/env python

import rospy

import actionlib 

from control_msgs.msg import FollowJointTrajectoryGoal
from control_msgs.msg import FollowJointTrajectoryAction
from sensor_msgs.msg  import JointState 
from trajectory_msgs.msg import JointTrajectory
from trajectory_msgs.msg import JointTrajectoryPoint
from constants import JointName
from constants import getActuatorIndexFromFrame
from  common import print_ros

max_effort=100

class robot_state:
    #Global variables
    actuator=[]
    rate = None

      

    def __init__(self):
        #print_ros("__init of robot_state started")
        rospy.init_node('robostilt_master_node', anonymous=True) # allows multiple instances of the master_node        
        self.rate=rospy.Rate(100) # 100hz                
        #8 actuators
        for i in range(0, 8): 
            self.actuator.append(Actuator(JointName.get(i)))   
            self.actuator[i].motor.effort_limit=-100 
        #initialize nodes
        rospy.Subscriber("/robostilt/joint_states", JointState, self._JoinstState_callback)
        #send all motors to their current position to reset the actionClient
        self.init_motors()
        #print_ros("done with __init")
        

    def _JoinstState_callback(self, data):
        #Maps positions from joint_states to current_position that has same indexes as controllers
        #Joint_states publishes joints in alphabetical order leg1-6, prismatic, revolute

            self.actuator[0].motor.position= data.position[6]
            self.actuator[0].motor.effort= data.effort[6]

            for i in range(0, 7): 
                self.actuator[i+1].motor.position = data.position[i]#legs
                self.actuator[i+1].motor.effort = data.effort[i]#legs

            self.actuator[7].motor.position = data.position[7]
            self.actuator[7].motor.effort = data.effort[7]

            #take care of offsets
           # for i in range(0, 8):
            #    self.actuator[i].motor.position = self.actuator[i].motor.position-self.actuator[i].motor.offset
            
            #Stop if we exceed torque limit
            for i in range(0,8):

                if(self.actuator[i].motor.effort_limit_negative!=None): #in case we havent initialized efort limit
                    if(self.actuator[i].motor.effort_limit_enabled==True):
                        if(self.actuator[i].motor.effort>self.actuator[i].motor.effort_limit_positive):
                            print_ros(JointName.get(i) + " +EFFORT LIMIT FAULT. tripped with=" +str(self.actuator[i].motor.effort)  +" +limit is= " +str(self.actuator[i].motor.effort_limit_positive))
                            self.actuator[i].motor.stop()

                        elif(self.actuator[i].motor.effort<self.actuator[i].motor.effort_limit_negative):      
                            print_ros(JointName.get(i) + " -EFFORT LIMIT FAULT. tripped with=" +str(self.actuator[i].motor.effort)  +" -limit is= " +str(self.actuator[i].motor.effort_limit_negative))
                            self.actuator[i].motor.stop()
                    else:
                        #Effort limit is not enabled, we are being temporarly overriden check since when and enable after timeout
                        if(rospy.get_time()-self.actuator[i].motor.effort_limit_override_start_time>self.actuator[i].motor.effort_limit_override_duration):
                            self.actuator[i].motor.effort_limit_enabled=True




    
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
        
        #wait for valid position from joint_states
        rate = rospy.Rate(100) # 100hz    
        while(self.actuator[0].motor.position==None):
            self.rate.sleep()
        #send all motors to their current position to reset the actionClient
        for i in range(0 ,7):            
            self.actuator[i].motor.assert_position()
        self.wait_for_all_actuators_to_finish()
        #print_ros("Done initializing motors")

    def set_effort_limit_on_frame(self, frame,effort_negative,effort_positive):
        indexes=getActuatorIndexFromFrame(frame)
        for i in indexes:
            self.actuator[i].motor.set_effort_limits(effort_negative,effort_positive)

    def set_effort_limit_to_max_on_frame(self, frame):
        indexes=getActuatorIndexFromFrame(frame)
        for i in indexes:
            self.actuator[i].motor.set_effort_limits(-1*max_effort,max_effort)
        
            

class Motor:    
    name= None
    actionClient=None 
    position = None    
    velocity = None
    effort = None
    offset = None #Command zero position and get the expected zero position. From parameters.yaml
    #status
    is_moving= None
    has_reached_goal=None
    #effort limits
    effort_limit_negative= None
    effort_limit_positive= None
    effort_limit_enabled=True
    effort_limit_override_duration=None
    effort_limit_override_start_time=None

    def __init__(self,name):
        self.name=name
        #self.offset=rospy.get_param("robostilt/dimensions/"+self.name+"_offset")
        controller_name="/robostilt/"+self.name+"_trajectory_controller/follow_joint_trajectory"
        #print_ros("Setting Action client of " + self.name )
        self.actionClient=actionlib.SimpleActionClient(controller_name, FollowJointTrajectoryAction)
        self.actionClient.wait_for_server()
        #print_ros("Action client ready " + self.name )

    def set_position(self, position_setpoint, speed_limit):
        #position_setpoint=position_setpoint+self.offset
        #Increase effort limits at the beginning.
        self.overide_effort_limits_for_time(0.5)
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
        #print_ros(trajectory.joint_names[0] + " new position set to: " + str(position_setpoint) +" old position is: " + str(self.position)+ " allowed time is is: " +str(time))
        self.is_moving=True  
        self.has_reached_goal=False 

    def set_effort_limits(self,effort_negative,effort_positive):
        #in case user messed up, flip them
        if(effort_negative>effort_positive):            
            dummy_positive=effort_positive
            effort_positive=effort_negative
            effort_negative=dummy_positive
            print_ros("Wrong limit order")

        self.effort_limit_positive=effort_positive
        self.effort_limit_negative=effort_negative

    def set_effort_limits_to_max(self):
        self.effort_limit_positive=max_effort
        self.effort_limit_negative=-1*max_effort

    def overide_effort_limits_for_time(self,duration):
        #the joint state callback will renable limits once duration is up.
        self.effort_limit_enabled=False
        self.effort_limit_override_duration=duration
        self.effort_limit_override_start_time=rospy.get_time()

    def stop(self):
        #Dont want to hame limited efforts to stop.
        self.set_effort_limits_to_max()       
        self.actionClient.cancel_all_goals()        
        #log info
        #print_ros(self.name + " STOPPED")
        self.is_moving=False 
        self.has_reached_goal=True

    def assert_position(self):
        #Dont want to hame limited efforts to assert.
        self.set_effort_limits_to_max()  
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
        #print_ros(trajectory.joint_names[0] + " asserted...")
        self.is_moving=True  
        self.has_reached_goal=False
      
    def _goal_done(self,state, result):
        #Triggers when action is completed       
        if(result.error_code==0):
                #print_ros(self.name +" has reached goal. Pos= "+ str(self.position))
                #reset client
                self.actionClient.cancel_all_goals()
                self.actionClient.stop_tracking_goal()  
                self.is_moving=False  
                self.has_reached_goal=True              
        else:
                print_ros(self.name +" FAILED to reach goal.")
                #double_print(getErrorInHumanReadableStr(result.error_code))
                #double_print(result.error_string)        
        


class Actuator:
    name= None
    motor = None
    has_been_homed=None

    def __init__(self,name):
         self.name=name
         self.motor=Motor(self.name)
   
    

    