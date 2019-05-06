#!/usr/bin/env python
import rospy
from controller_manager_msgs.srv import SwitchController


rospy.init_node('initialize_controllers', anonymous=True)
rospy.wait_for_service('/robostilt/controller_manager/switch_controller')
rospy.loginfo("Controller manager loaded, starting controllers..." )
#Gazebo simulation needs to be running to proceed below
try:
    switch_controller = rospy.ServiceProxy(
                       '/robostilt/controller_manager/switch_controller', SwitchController)


    # one at at time
    start_controllers=["trajectory_controller"]
    stop_controllers=[]
    ret = switch_controller(start_controllers, stop_controllers,2) 


    start_controllers=["joint_state_controller"]
    stop_controllers=[]
    ret = switch_controller(start_controllers, stop_controllers,2) 

    rospy.loginfo("Controllers started." ) 

except rospy.ServiceException, e:
      print "Service call failed: %s"%e
