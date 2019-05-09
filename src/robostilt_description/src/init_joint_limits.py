#! /usr/bin/env python
import rospy

leg_lenght=rospy.get_param("/dimensions/leg_length")





#copy parameters to all legs
suffix="/joint_limits/leg_"

param_list=[
        'has_position_limits',
        'min_position',
        'max_position',
        'has_velocity_limits',
        'max_velocity',
        'has_acceleration_limits',
        'max_acceleration',
        'has_jerk_limits',
        'max_jerk',
        'has_effort_limits',
        'max_effort'
]


for i in range(2, 6):
    for param in param_list:
        value=rospy.get_param(suffix+str(1)+"/"+param) #gets value from leg1 in joint_parameters.yaml
        rospy.set_param(suffix+str(i)+"/"+param, value)