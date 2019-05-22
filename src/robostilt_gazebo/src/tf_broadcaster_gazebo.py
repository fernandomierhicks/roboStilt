#!/usr/bin/env python

# This node broadcasts the TF transform to "base_link" with respect to "world" from Gazebo
from geometry_msgs.msg import Quaternion
from geometry_msgs.msg import PoseWithCovarianceStamped
from geometry_msgs.msg import Pose
from gazebo_msgs.msg import ModelStates
import tf
import rospy
import roslib
roslib.load_manifest('robostilt_gazebo')

# Publishes gazebo pose to the  "world" to frame "base_link" tf.


def _handle_robostilt_pose_callback(msg):
    # Cycle thorugh all the models and get transfrom from robostilt
    for i in range(0, len(msg.name)):
        if(msg.name[i] == 'robostilt'):
            x = msg.pose[i].position.x
            y = msg.pose[i].position.y
            z = msg.pose[i].position.z
            rot_q = msg.pose[i].orientation
            #str = "Published tf with x value %s" % x
            # rospy.loginfo(str)
            br = tf.TransformBroadcaster()
            br.sendTransform((x, y, z),
                             ([rot_q.x, rot_q.y, rot_q.z, rot_q.w]),
                             rospy.Time.now(),
                             "base_link",
                             "world")


def setup_ros_interface():
    # Variables
    package_name = "gazebo"
    node_name = "tf_broadcaster"
    # Node
    rospy.init_node(node_name, anonymous=False)
    rospy.loginfo("Node robostilt/"+package_name +
                  "/" + node_name + " started.")
    # Subscribers
    rospy.Subscriber("/gazebo/model_states",
                     ModelStates, _handle_robostilt_pose_callback)
    # wait for...
    topic_name = "gazebo/model_states"
    rospy.loginfo("Waiting for message on topic " + topic_name + " ...")
    rospy.wait_for_message(topic_name, ModelStates)


if __name__ == '__main__':
    setup_ros_interface()
    while not rospy.is_shutdown():
        rospy.spin()
