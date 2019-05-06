#!/usr/bin/env python

# This node updates the joint setpoint to implement a gait using a position_controller for each leg

import rospy
import math

from std_msgs.msg import Float64


def update_gait():
    setpoint_leg = []
    for i in range(1, 7):
        topic_name = "/robostilt/leg_"+str(i)+"_position_controller/command"
        setpoint_leg.append(rospy.Publisher(topic_name, Float64, queue_size=10))

    rospy.init_node('update_gain')
    rate = rospy.Rate(50)  # 50hz

    while not rospy.is_shutdown():
        time = rospy.get_time()
        # sine between -0.4 and  -0.6
        setpoint = math.sin(time)*0.1-0.5

        for i in range(1, 7):
            output = "Setpoint"+str(i)+" = " + str(setpoint)
            rospy.loginfo(output)    
            setpoint_leg[i-1].publish(setpoint)

        rate.sleep()


if __name__ == '__main__':
    try:
        update_gait()
    except rospy.ROSInterruptException:
        pass
