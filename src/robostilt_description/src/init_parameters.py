#! /usr/bin/env python
import rospy

leg_lenght=rospy.get_param("/dimensions/leg_length")


#copy parameters to all legs
suffix="/joint_limits/leg_"


for i in range(1, 6):
    #set position limits
    #set velocity limits
    #set acceleration and jerk
    rospy.set_param(suffix+str(i)+"/has_acceleration_limits", True)
    rospy.set_param(suffix+str(i)+"/max_acceleration", True)
    rospy.set_param(suffix+str(i)+"/has_jerk_limits", True)
    rospy.set_param(suffix+str(i)+"/max_jerk", True)

    

     has_acceleration_limits: true
        : 5.0
        : true
        : 100.0
    #set effort limits





    /joint_limits/leg_1/has_acceleration_limits: True
