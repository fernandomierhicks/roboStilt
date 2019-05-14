#!/usr/bin/env python  

## This node broadcasts the TF transform to "base_link" with respect to "world" from Gazebo
import roslib
roslib.load_manifest('robostilt_gazebo')
import rospy

import tf
from gazebo_msgs.msg import ModelStates
from geometry_msgs.msg import Pose
from geometry_msgs.msg import PoseWithCovarianceStamped
from geometry_msgs.msg import Quaternion

def handle_robostilt_pose(msg):   
   # Publishes gazebo pose to the  "world" to frame "base_link" tf.

    global x
    global y
    global z
    global theta


    #Cycle thorugh all the models and get transfrom from robostilt
    for i in range(0, len(msg.name)):
        if(msg.name[i]=='robostilt'):
            x = msg.pose[i].position.x
            y = msg.pose[i].position.y
            z = msg.pose[i].position.z
            rot_q = msg.pose[i].orientation
            #str = "Published tf with x value %s" % x
            #rospy.loginfo(str)
            br = tf.TransformBroadcaster()
            br.sendTransform((x, y, z),
                        ([rot_q.x,rot_q.y,rot_q.z,rot_q.w]),
                    rospy.Time.now(),
                    "base_link",
                    "world")



if __name__ == '__main__':
    rospy.init_node('tf_base_link_broadcaster_gazebo_to_rviz')   
    #Subscribe to link_states coming from Gazebo.
    rospy.Subscriber("/gazebo/model_states",ModelStates,handle_robostilt_pose)
    rospy.spin()






