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


def move_legs_down_on_frame(frame):

    trajectory = JointTrajectory()
    point = JointTrajectoryPoint()

    #Final position
    point.positions = [-0.8,-0.8,-0.8]
    trajectory.points.append(point)

    #How long to get there
    trajectory.points[0].time_from_start=rospy.Duration(5.0)

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

if __name__ == '__main__':
    #initialize node
    rospy.init_node('sendActionClient')
    print 'Created node  sendActionClient'

    #initialize action client       
    client = actionlib.SimpleActionClient('/robostilt/trajectory_controller/follow_joint_trajectory', FollowJointTrajectoryAction)
    print 'Waiting for server...'
    client.wait_for_server()
    print 'Client listening'

    # Send goal
    goal=move_legs_down_on_frame(FRAME_ODD)
    client.send_goal(goal)
    print 'Goal sent'

    #wait for result
    client.wait_for_result()
    result = client.get_result()
    print(getErrorInHumanReadableStr(result.error_code))
    print(result.error_string)
 



