#! /usr/bin/env python

import roslib
import rospy 
import actionlib 


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
def set_initial_position():

    trajectory = JointTrajectory()
    point = JointTrajectoryPoint()

    #Final position
    point.positions = [-0.6,-0.2,-0.2,-0.2,-0.2,-0.2,-0.2,0.0]
    trajectory.points.append(point)

    #How long to get there
    trajectory.points[0].time_from_start=rospy.Duration(0.1)
    trajectory.joint_names.append("base_link_to_third_frame")
    trajectory.joint_names.append("odd_frame_to_leg_1")
    trajectory.joint_names.append("base_link_to_leg_2")
    trajectory.joint_names.append("odd_frame_to_leg_3")     
    trajectory.joint_names.append("base_link_to_leg_4")          
    trajectory.joint_names.append("odd_frame_to_leg_5")   
    trajectory.joint_names.append("base_link_to_leg_6")    
    trajectory.joint_names.append("third_frame_to_odd_frame")   
    #return
    follow_trajectory_goal = FollowJointTrajectoryGoal()
    follow_trajectory_goal.trajectory = trajectory
    return follow_trajectory_goal

def move_third_frame(position,rotation):

    trajectory = JointTrajectory()
    point = JointTrajectoryPoint()

    #Final position
    point.positions = [position,rotation]
    trajectory.points.append(point)

    #How long to get there
    trajectory.points[0].time_from_start=rospy.Duration(2.0)

    #which frame to move
    trajectory.joint_names.append("base_link_to_third_frame")
    trajectory.joint_names.append("third_frame_to_odd_frame") 

    #return
    follow_trajectory_goal = FollowJointTrajectoryGoal()
    follow_trajectory_goal.trajectory = trajectory
    return follow_trajectory_goal

def move_legs_on_frame(frame, position):

    trajectory = JointTrajectory()
    point = JointTrajectoryPoint()

    #Final position
    point.positions = [position,position,position]
    trajectory.points.append(point)

    #How long to get there
    trajectory.points[0].time_from_start=rospy.Duration(2.0)

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
    client.send_goal(goal)
    double_print('---Goal sent. Waiting for completion.')

    #wait for result
    client.wait_for_result()
    result = client.get_result()# Wait for result. Can put internal timeout if nessesary    
    if(result.error_code==0):
            double_print("---Goal completed.")
    else:
            double_print("---Goal FAILED.")

    double_print(getErrorInHumanReadableStr(result.error_code))
    double_print(result.error_string)

    #reset client
    client.cancel_all_goals()
    client.stop_tracking_goal()


if __name__ == '__main__':
    #initialize node
    rospy.init_node('sendActionClient')
    double_print('Created node  sendActionClient')

    #initialize action client       
    client = actionlib.SimpleActionClient('/robostilt/trajectory_controller/follow_joint_trajectory', FollowJointTrajectoryAction)
    double_print('Waiting for action server...')
    client.wait_for_server()
    double_print( 'Action client listening')

    # Set controller in initial position
    send_goal_and_wait(set_initial_position(),"*Initializing positions...")
    
    

    while(1==1):
        #Move EVEN down
        send_goal_and_wait(move_legs_on_frame(FRAME_EVEN,-0.6),"*Moving EVEN frame DOWN...")
        

        #Move PRISMATIC forward
        send_goal_and_wait(move_third_frame(-0.2,0.0),"*Moving FORWARD...")
        

        #Move ODD down
        send_goal_and_wait(move_legs_on_frame(FRAME_ODD,-0.8),"*Moving ODD frame DOWN...")
        

        #Move EVEN up
        send_goal_and_wait(move_legs_on_frame(FRAME_EVEN,-0.2),"*Moving EVEN frame UP...")
        

        #Move PRISMATIC forward
        send_goal_and_wait(move_third_frame(-0.6,0.0),"*Moving BACKWARD...")
        

        #Move EVEN down
        send_goal_and_wait(move_legs_on_frame(FRAME_EVEN,-0.6),"*Moving EVEN frame DOWN...")
        

        #Move EVEN up
        send_goal_and_wait(move_legs_on_frame(FRAME_ODD,-0.2),"*Moving ODD frame UP...")

        raw_input("Press ENTER to continue...")

