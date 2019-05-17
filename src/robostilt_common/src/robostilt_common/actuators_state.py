#! /usr/bin/env python

import rospy

import actionlib 

from control_msgs.msg import FollowJointTrajectoryGoal
from control_msgs.msg import FollowJointTrajectoryAction
from control_msgs.msg import JointTolerance
from sensor_msgs.msg  import JointState 
from trajectory_msgs.msg import JointTrajectory
from trajectory_msgs.msg import JointTrajectoryPoint


import functions as f

import parameters as p
from constants import constants as C



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
    goal_start_time=None
    goal_duration_time_limit=None
    goal_position=None
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
        #f.print_ros("Setting Action client of " + self.name )
        self.actionClient=actionlib.SimpleActionClient(controller_name, FollowJointTrajectoryAction)        
        
    def startActionServer(self):
        self.actionClient.wait_for_server()
        #f.print_ros("Action client ready " + self.name )

    def createPositionGoal(self, position_setpoint, speed_limit):
        #set up variables
        trajectory = JointTrajectory()
        point = JointTrajectoryPoint()
        #Final position
        point.positions = [position_setpoint]
        trajectory.points.append(point)
        self.goal_position=position_setpoint
        #How long to get there
        time_for_move=abs(self.position-position_setpoint)/speed_limit

        if(time_for_move<=0.1):
            time_for_move=0.1 #probably asserting joint. 

        trajectory.points[0].time_from_start=rospy.Duration(time_for_move)
        self.goal_duration_time_limit=rospy.Duration(time_for_move)     
        #specify which joint to move
        trajectory.joint_names.append(self.name)
        #send trajectory
        follow_trajectory_goal = FollowJointTrajectoryGoal()
        follow_trajectory_goal.trajectory = trajectory

        #TOLERANCES FOR MOVE
        #For some reason the defaults are not being loaded from control.yaml
        tolerance=JointTolerance()

        tolerance.name=self.name # joint name        
        tolerance.velocity=-1 # no fault for velocity
        tolerance.acceleration=-1  # no fault for acceleration

        #Tracking fault
        tolerance.position=-1#p.constraints.trajectory
        follow_trajectory_goal.path_tolerance.append(tolerance)

        #End position fault
        tolerance.position=-1 #p.constraints.goal_pos
        follow_trajectory_goal.goal_tolerance.append(tolerance)

        #Time to reach goal precision        
        #follow_trajectory_goal.goal_time_tolerance=rospy.Duration(int(p.constraints.goal_time))
        follow_trajectory_goal.goal_time_tolerance=rospy.Duration(10.0)
       
        #f.print_ros("Path tolerance= " +str (follow_trajectory_goal.path_tolerance[0]))
        #f.print_ros("Goal tolerance= " +str (follow_trajectory_goal.goal_tolerance[0]))
        #f.print_ros("Goal time= " +str (follow_trajectory_goal))

        return follow_trajectory_goal        

    def sendPositionGoal(self, goal):
        #send goal and register callback when done 
        self.actionClient.send_goal(goal,done_cb=self._goal_done)
        self.goal_start_time=rospy.Time.now()

        self.is_moving=True  
        self.has_reached_goal=False
        


    def set_position(self, position_setpoint, speed_limit):
        #position_setpoint=position_setpoint+self.offset
        #Increase effort limits at the beginning.
        self.overide_effort_limits_for_time(0.5)
        goal=self.createPositionGoal(position_setpoint, speed_limit)
        self.sendPositionGoal(goal)        
        #log info
        f.print_ros(self.name + " new position set to: " + str(self.goal_position) +" old position is: " + str(self.position)+ " allowed time is is: " +f.str_time(self.goal_duration_time_limit))


    def set_effort_limits(self,effort_negative,effort_positive):
        #in case user messed up, flip them
        if(effort_negative>effort_positive):            
            dummy_positive=effort_positive
            effort_positive=effort_negative
            effort_negative=dummy_positive
            f.print_ros("Wrong limit order")

        self.effort_limit_positive=effort_positive
        self.effort_limit_negative=effort_negative

    def set_effort_limits_to_max(self):
        self.effort_limit_positive= p.effort.leg_max
        self.effort_limit_negative=-1*p.effort.leg_max

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
        #f.print_ros(self.name + " STOPPED")
        self.is_moving=False 
        self.has_reached_goal=True

    def assert_position(self,speed_limit):
        #Dont want to hame limited efforts to assert.
        self.set_effort_limits_to_max()  
        goal=self.createPositionGoal(self.position, speed_limit)
        self.sendPositionGoal(goal)     
        #log info
        f.print_ros(self.name + " asserting to position= "+ str(self.position))

      
    def _goal_done(self,state, result):
        #Triggers when action is completed       
        if(result.error_code==0):
                f.print_ros(self.name +" has reached goal. Pos= "+ str(self.position))
                #reset client
                self.actionClient.cancel_all_goals()
                self.actionClient.stop_tracking_goal()  
                self.is_moving=False  
                self.has_reached_goal=True              
        else:
                error_code_to_string =	{
                    0: "SUCCESS",
                    -1: "INVALID_GOAL",
                    -2: "INVALID_JOINTS",
                    -3: "OLDER_HEADER_TIMESTAMP",
                    -4: "PATH_TOLERANCE_VIOLATED.", #Position error exceeded limit during move. Tracking fault",
                    -5: "GOAL_TOLERANCE_VIOLATED."# Move did not reach goal position with the tolerance needed in the allowed time",
                    }

                currentTime=rospy.Time.now()

                f.print_ros(self.name +" FAILED to reach goal." + error_code_to_string.get(result.error_code))
                
                f.print_ros(self.name+ " Current position= " +f.str_trunc(self.position) + " Goal position is= " + f.str_trunc(self.goal_position)+" Error= "+f.str_trunc(self.goal_position-self.position))
                


                f.print_ros(self.name +" Goal started at= " + f.str_time(self.goal_start_time) + " Goal time expired at= "+ f.str_time(self.goal_start_time+self.goal_duration_time_limit))

               
                #f.print_ros(result.error_code)
                #f.print_ros(result.error_string)        
                self.has_reached_goal=False


class Actuator:
    name= None
    motor = None
    has_been_homed=False
    is_supporting=False

    def __init__(self,name):
         self.name=name
         self.motor=Motor(self.name)
         f.print_ros("Actuator " + name + " setup complete")



class actuators_state:
    #Global variables
    actuator=[Actuator(C.ACTUATOR.getNameFromIndex(0))] # To enable autocomplete

    
    rate = None      

    def __init__(self):
        f.print_ros("Actuators setup started")
        p.read_from_parameter_server()
        #rospy.init_node('robostilt_master_node', anonymous=True) # allows multiple instances of the master_node        
        self.rate=rospy.Rate(100) # 100hz     
        
        #8 actuators, actuator zero is defined above to enable autocomplete
        for i in range(1, C.ACTUATOR.count):
            newActuator=Actuator(C.ACTUATOR.getNameFromIndex(i))
            self.actuator.append(newActuator)  

        for i in range(0, C.ACTUATOR.count):
            self.actuator[i].motor.effort_limit=-100 
            self.actuator[i].motor.startActionServer()

            
          
        #initialize nodes
        rospy.Subscriber("/robostilt/joint_states", JointState, self._JoinstState_callback)        
        #send all motors to their current position to reset the actionClient
        self.init_motors()
        f.print_ros("Actuators setup complete.") 

        

    def _JoinstState_callback(self, data):
        #Maps positions from joint_states to current_position that has same indexes as controllers
        #Joint_states publishes joints in alphabetical order leg1-6, prismatic, revolute

            self.actuator[0].motor.position= data.position[6]
            self.actuator[0].motor.effort= data.effort[6]

            for i in range(0, C.ACTUATOR.count-1): 
                self.actuator[i+1].motor.position = data.position[i]#legs
                self.actuator[i+1].motor.effort = data.effort[i]#legs

            self.actuator[C.ACTUATOR.count-1].motor.position = data.position[7]
            self.actuator[C.ACTUATOR.count-1].motor.effort = data.effort[7]

            #take care of offsets
           # for i in range(0, 8):
            #    self.actuator[i].motor.position = self.actuator[i].motor.position-self.actuator[i].motor.offset
            
            #Stop if we exceed torque limit
            for i in range(0,C.ACTUATOR.count):

                if(self.actuator[i].motor.effort_limit_negative!=None): #in case we havent initialized efort limit
                    if(self.actuator[i].motor.effort_limit_enabled==True):
                        if(self.actuator[i].motor.effort>self.actuator[i].motor.effort_limit_positive):
                            f.print_ros(C.ACTUATOR.getNameFromIndex(i) + " +EFFORT LIMIT FAULT. tripped with=" +str(self.actuator[i].motor.effort)  +" +limit is= " +str(self.actuator[i].motor.effort_limit_positive))
                            self.actuator[i].motor.stop()

                        elif(self.actuator[i].motor.effort<self.actuator[i].motor.effort_limit_negative):      
                            f.print_ros(C.ACTUATOR.getNameFromIndex(i) + " -EFFORT LIMIT FAULT. tripped with=" +str(self.actuator[i].motor.effort)  +" -limit is= " +str(self.actuator[i].motor.effort_limit_negative))
                            self.actuator[i].motor.stop()
                    else:
                        #Effort limit is not enabled, we are being temporarly overriden check since when and enable after timeout
                        if(rospy.get_time()-self.actuator[i].motor.effort_limit_override_start_time>self.actuator[i].motor.effort_limit_override_duration):
                            self.actuator[i].motor.effort_limit_enabled=True




    
    def have_all_actuators_reached_goal(self):
        result=True
        for i in range(0 ,C.ACTUATOR.count):
            if(self.actuator[i].motor.has_reached_goal==False):
                result=False
                break
        return result

    def wait_for_all_actuators_to_finish(self):       
        while(self.have_all_actuators_reached_goal()==False):
            self.rate.sleep()

    def init_motors(self):
        #wait for valid position from joint_states
        f.print_ros("Waiting for valid joint positions...") 
        rate = rospy.Rate(100) # 100hz    
        while(self.actuator[0].motor.position==None):
            self.rate.sleep()
        #send all motors to their current position to reset the actionClient
        #for i in range(0 ,C.ACTUATOR.count):            
        #    self.actuator[i].motor.assert_position(p.speed.lowering_legs)
        #self.wait_for_all_actuators_to_finish()
        #f.print_ros("Done initializing motors")

    def set_effort_limit_on_frame(self, frame,effort_negative,effort_positive):
        indexes=getActuatorIndexesFromFrame(frame)
        for i in indexes:
            self.actuator[i].motor.set_effort_limits(effort_negative,effort_positive)

    def set_effort_limit_to_max_on_frame(self, frame):
        indexes=getActuatorIndexesFromFrame(frame)
        for i in indexes:
            self.actuator[i].motor.set_effort_limits(-1*max_effort,max_effort)
   
    

    