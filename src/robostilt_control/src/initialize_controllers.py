#!/usr/bin/env python
import rospy
import dynamic_reconfigure.client
from std_msgs.msg import Float64

# Since PID gains of controllers are dynamic reconfigure type, we need this script to update all controller gains to whatever is on the param server. 


rospy.init_node('initialize_controllers', anonymous=True)


##LEGS
leg_p = rospy.get_param('robostilt/leg_pid_gains/p')
leg_i = rospy.get_param('robostilt/leg_pid_gains/i')
leg_d = rospy.get_param('robostilt/leg_pid_gains/d')

for i in range (1, 6):
    node_name="/robostilt/leg_"+str(i)+"_position_controller/pid"
    client = dynamic_reconfigure.client.Client(node_name, timeout=30)
    client.update_configuration({"p":leg_p })
    client.update_configuration({"i":leg_i })
    client.update_configuration({"d":leg_d })
    #set initial setpoints


# Third frame
words= ['revolute','prismatic']
for i in words:
    third_frame_p = rospy.get_param('robostilt/third_frame_'+str(i)+'_pid_gains/p')
    third_frame_i = rospy.get_param('robostilt/third_frame_'+str(i)+'_pid_gains/i')
    third_frame_d = rospy.get_param('robostilt/third_frame_'+str(i)+'_pid_gains/d')

    node_name="/robostilt/third_frame_"+str(i)+"_position_controller/pid"
    client = dynamic_reconfigure.client.Client(node_name, timeout=30)
    client.update_configuration({"p":third_frame_p })
    client.update_configuration({"i":third_frame_i })
    client.update_configuration({"d":third_frame_d })





rospy.loginfo("Initialized all PID controllers with gains and initial setpoints")