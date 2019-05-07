#! /usr/bin/env python

# This node sends a single trajectory to multiple controllers

import roslib
import rospy 
import actionlib 


from control_msgs.msg import FollowJointTrajectoryGoal
from control_msgs.msg import FollowJointTrajectoryAction
 
from trajectory_msgs.msg import (
    JointTrajectory,
    JointTrajectoryPoint
)


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

if __name__ == '__main__':

    rospy.init_node('sendActionClient')
    print 'Created node  sendActionClient'

    #  point
    joint_trajectory_point1 = JointTrajectoryPoint()
    joint_trajectory_point1.positions = [-0.8]
    # if no velocities are specified, the interpolation is linear
    # if  velocities are specified, the interpolation is a cubic spline
    #joint_trajectory_point1.velocities = [1.0]

    joint_trajectory_point2 = JointTrajectoryPoint()
    joint_trajectory_point2.positions = [-0.2]
    #joint_trajectory_point1.velocities = [1.0]

    print 'Created points'

    #  trajectory
    joint_trajectory_msg = JointTrajectory()
    joint_trajectory_msg.joint_names.append("leg_2")
    joint_trajectory_msg.points.append(joint_trajectory_point1)
    joint_trajectory_msg.points.append(joint_trajectory_point2)

    speed=0.2
    delta_pos=0.6
    time=delta_pos/speed

    joint_trajectory_msg.points[0].time_from_start=rospy.Duration(time)  
    joint_trajectory_msg.points[1].time_from_start=rospy.Duration(time*2)  

    print 'Created trajectory'
    #  goal
    goal = FollowJointTrajectoryGoal()
    goal.trajectory = joint_trajectory_msg
    print 'Created goal'
    #  client
    
    client = actionlib.SimpleActionClient('/robostilt/leg_2_trajectory_controller/follow_joint_trajectory', FollowJointTrajectoryAction)
    print 'Waiting for server...'
    client.wait_for_server()
    print 'Client listening'
    # Send goal
    client.send_goal(goal)
    print 'Goal sent'
    client.wait_for_result()
    result = client.get_result()
    print(getErrorInHumanReadableStr(result.error_code))
    print(result.error_string)
 



