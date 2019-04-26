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


def moveLegsDownOnFrame(frame):

    joint_trajectory_point = JointTrajectoryPoint()
    joint_trajectory_point.positions = [-0.8,-0.8,-0.8]
    joint_trajectory_msg = JointTrajectory()
    
    if(frame==FRAME_EVEN):
        joint_trajectory_msg.joint_names.append("base_link_to_leg_2")
        joint_trajectory_msg.joint_names.append("base_link_to_leg_4")     
        joint_trajectory_msg.joint_names.append("base_link_to_leg_6")
    else if(frame==FRAME_ODD):
        joint_trajectory_msg.joint_names.append("odd_frame_to_leg_1")
        joint_trajectory_msg.joint_names.append("odd_frame_to_leg_3")     
        joint_trajectory_msg.joint_names.append("odd_frame_to_leg_5")
    else:
        print 'INVALID FRAME SELECTED'
        return

    joint_trajectory_msg.points.append(joint_trajectory_point)
    joint_trajectory_msg.points[0].time_from_start=rospy.Duration(10.0)  #  How long to reach that position

    follow_trajectory_goal = FollowJointTrajectoryGoal()
    follow_trajectory_goal.trajectory = joint_trajectory_msg

    return follow_trajectory_goal

if __name__ == '__main__':

    rospy.init_node('sendActionClient')
    print 'Created node  sendActionClient'

       
    client = actionlib.SimpleActionClient('/robostilt/trajectory_controller/follow_joint_trajectory', FollowJointTrajectoryAction)
    print 'Waiting for server...'
    client.wait_for_server()
    print 'Client listening'
    # Send goal
    goal=moveLegsDownOnFrame(FRAME_EVEN)
    client.send_goal(goal)
    print 'Goal sent'
    client.wait_for_result()
    result = client.get_result()
    print(getErrorInHumanReadableStr(result.error_code))
    print(result.error_string)
 



