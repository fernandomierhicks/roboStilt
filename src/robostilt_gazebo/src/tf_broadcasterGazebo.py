#!/usr/bin/env python

# This node gets the keyboard input from terminal as arrow presses and broadcasts that as a TF transform to "base_link" with respect to "world"
from geometry_msgs.msg import Quaternion
from geometry_msgs.msg import PoseWithCovarianceStamped
from geometry_msgs.msg import Pose
from gazebo_msgs.msg import ModelStates
import tf
import rospy
import roslib
roslib.load_manifest('robostilt_gazebo')


def handle_robostilt_pose(msg):
   # Publishes gazebo pose to the  "world" to frame "base_link" tf.

    global x
    global y
    global z
    global theta

    x = msg.pose[1].position.x
    y = msg.pose[1].position.y
    z = msg.pose[1].position.z
    rot_q = msg.pose[1].orientation

    #str = "Published tf with x value %s" % x
    # rospy.loginfo(str)

    br = tf.TransformBroadcaster()
    br.sendTransform((x, y, z),
                     ([rot_q.x, rot_q.y, rot_q.z, rot_q.w]),
                     rospy.Time.now(),
                     "base_link",
                     "world")


if __name__ == '__main__':
    rospy.init_node('tf_base_link_broadcaster_gazebo_to_rviz')
    # Subscribe to link_states coming from Gazebo.
    rospy.Subscriber("/gazebo/model_states",
                     ModelStates, handle_robostilt_pose)
    rospy.spin()
