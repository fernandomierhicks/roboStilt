#! /usr/bin/env python

# This node updates the setpoint of the trajectory conbtroller to do one full forward sequence. 

import roslib
import rospy 
import actionlib 
import time


from control_msgs.msg import FollowJointTrajectoryGoal
from control_msgs.msg import FollowJointTrajectoryAction
 
from trajectory_msgs.msg import (
    JointTrajectory,
    JointTrajectoryPoint
)

# CONSTANTS
FRAME_THIRD_PRISMATIC=0
FRAME_ODD=1
FRAME_EVEN=2
FRAME_THIRD_REVOLUTE=3

THIRD_FRAME_PRISMATIC=0
LEG_1=1
LEG_2=2
LEG_3=3
LEG_4=4
LEG_5=5
LEG_6=6
THIRD_FRAME_REVOLUTE=0

SPEED=0.4

# HELPER FUNCTIONS
def double_print(message):
    #rospy.loginfo(message)
    print(message)

def getErrorInHumanReadableStr(error_code):

    #  definitions from here: http://docs.ros.org/api/control_msgs/html/action/FollowJointTrajectory.html
    dictionary = {
        0: "SUCCESS",
        -1: "INVALID_GOAL",
        -2: "INVALID_JOINTS",
        -3: "OLD_HEADER_TIMESTAMP",
        -4: "PATH_TOLERANCE_VIOLATED",
        -5: "GOAL_TOLERANCE_VIOLATED"
    }
    return dictionary.get(error_code, "Invalid error code")


# SET TRAJECTORIES
def set_position_leg(index,position):

    trajectory = JointTrajectory()
    point = JointTrajectoryPoint()

    #Final position
    point.positions = [position]
    trajectory.points.append(point)

    #How long to get there
    trajectory.points[0].time_from_start=rospy.Duration(1)
    trajectory.joint_names.append("leg_"+str(index))
    #return
    follow_trajectory_goal = FollowJointTrajectoryGoal()
    follow_trajectory_goal.trajectory = trajectory    

    client[index].send_goal(follow_trajectory_goal)
    double_print('---Goal sent. Waiting for completion.')

    #wait for result
    client[index].wait_for_result()
    result = client[index].get_result()# Wait for result. Can put internal timeout if nessesary    
    if(result.error_code==0):
            double_print("---Goal completed.")
    else:
            double_print("---Goal FAILED.")

    double_print(getErrorInHumanReadableStr(result.error_code))
    double_print(result.error_string)

    #reset client
    client[index].cancel_all_goals()
    client[index].stop_tracking_goal()


def move_third_frame(position,rotation, position_delta):

    trajectory = JointTrajectory()
    point = JointTrajectoryPoint()

    #Final position
    point.positions = [position,rotation]
    trajectory.points.append(point)

    #How long to get there
    trajectory.points[0].time_from_start=rospy.Duration(position_delta/SPEED)

    #which frame to move
    trajectory.joint_names.append("base_link_to_third_frame")
    trajectory.joint_names.append("third_frame_to_odd_frame") 

    #return
    follow_trajectory_goal = FollowJointTrajectoryGoal()
    follow_trajectory_goal.trajectory = trajectory
    return follow_trajectory_goal

def move_legs_on_frame(frame, position, position_delta):

    trajectory = JointTrajectory()
    point = JointTrajectoryPoint()

    #Final position
    point.positions = [position,position,position]
    trajectory.points.append(point)

    #How long to get there
    trajectory.points[0].time_from_start=rospy.Duration(position_delta/SPEED)

    #which frame to move
    if(frame==FRAME_EVEN):
        trajectory.joint_names.append("base_link_to_leg_2")
        trajectory.joint_names.append("base_link_to_leg_4")     
        trajectory.joint_names.append("base_link_to_leg_6")
    elif(frame==FRAME_ODD):
        trajectory.joint_names.append("odd_frame_to_leg_1")
        trajectory.joint_names.append("odd_frame_to_leg_3")     
        trajectory.joint_names.append("odd_frame_to_leg_5")
    else:
        print 'INVALID FRAME SELECTED'
        return
    #return
    follow_trajectory_goal = FollowJointTrajectoryGoal()
    follow_trajectory_goal.trajectory = trajectory

    return follow_trajectory_goal



def send_goal_and_wait(goal, message):     

    double_print(message)
    client[0].send_goal(goal)
    double_print('---Goal sent. Waiting for completion.')

    #wait for result
    client[0].wait_for_result()
    result = client[0].get_result()# Wait for result. Can put internal timeout if nessesary    
    if(result.error_code==0):
            double_print("---Goal completed.")
    else:
            double_print("---Goal FAILED.")

    double_print(getErrorInHumanReadableStr(result.error_code))
    double_print(result.error_string)

    #reset client
    client[0].cancel_all_goals()
    client[0].stop_tracking_goal()





 # -----------------------------------------------------------------------------------------------------       MAIN
if __name__ == '__main__':
    #initialize node
    rospy.init_node('trajectoryControllerActionClient')
    double_print('Created node trajectoryControllerActionClient')

    #initialize action clients     
    client=[]
    client.append( actionlib.SimpleActionClient('/robostilt/third_frame_prismatic_trajectory_controller/follow_joint_trajectory', FollowJointTrajectoryAction))
    for i in range(1,7):
        name="/robostilt/leg_"+str(i)+"_trajectory_controller/follow_joint_trajectory"
        double_print(name)
        client.append(actionlib.SimpleActionClient(name, FollowJointTrajectoryAction))
    client.append( actionlib.SimpleActionClient('/robostilt/third_frame_revolute_trajectory_controller/follow_joint_trajectory', FollowJointTrajectoryAction))
    
    double_print('Waiting for action servers...')
    for i in range(0,7): 
        double_print( 'Waiting on: '+str(i))
        client[i].wait_for_server()

    double_print( 'Action clients listening')

    # Set controller in initial position
    set_position_leg(2,-0.8)
    # delay=0.1

    # #Move EVEN down
    # send_goal_and_wait(move_legs_on_frame(FRAME_EVEN,-0.55,0.35),"*Moving EVEN frame DOWN...")        
    # time.sleep(delay)

    # raw_input("Press Enter to continue...")

    # while(1==1):


    #     #Move PRISMATIC forward
    #     send_goal_and_wait(move_third_frame(-0.2,0.0,0.4),"*Moving FORWARD...")
    #     time.sleep(delay)

    #     #Move ODD down
    #     send_goal_and_wait(move_legs_on_frame(FRAME_ODD,-0.8,0.6),"*Moving ODD frame DOWN...")        
    #     time.sleep(delay)

    #     #Move EVEN up
    #     send_goal_and_wait(move_legs_on_frame(FRAME_EVEN,-0.2,0.4),"*Moving EVEN frame UP...")
    #     time.sleep(delay)

    #     #Move PRISMATIC forward
    #     send_goal_and_wait(move_third_frame(-0.6,0.0,0.4),"*Moving BACKWARD...")
    #     time.sleep(delay)

    #     #Move EVEN down
    #     send_goal_and_wait(move_legs_on_frame(FRAME_EVEN,-0.55,0.35),"*Moving EVEN frame DOWN...")        
    #     time.sleep(delay)

    #     #Move EVEN up
    #     send_goal_and_wait(move_legs_on_frame(FRAME_ODD,-0.2, 0.4 ),"*Moving ODD frame UP...")
    #     time.sleep(delay)


