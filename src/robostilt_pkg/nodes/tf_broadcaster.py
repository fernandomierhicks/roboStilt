#!/usr/bin/env python  
import roslib
roslib.load_manifest('robostilt_pkg')
import rospy

import tf
import turtlesim.msg

def handle_turtle_pose(msg):
   # The handler function for the turtle pose message broadcasts this turtle's translation and rotation, 
   # and publishes it as a transform from frame "world" to frame "base_link".
    br = tf.TransformBroadcaster()
    br.sendTransform((msg.x, msg.y, 0),
                     tf.transformations.quaternion_from_euler(0, 0, msg.theta),
                     rospy.Time.now(),
                     "base_link",
                     "world")

if __name__ == '__main__':
    rospy.init_node('tf_broadcaster')

    # This node takes a single parameter "turtle", which specifies a turtle name, e.g. "turtle1" or "turtle2".
    turtlename = rospy.get_param('~turtle')

    #The node subscribes to topic "turtleX/pose" and runs function handle_turtle_pose on every incoming message.
    rospy.Subscriber('/%s/pose' % turtlename,
                     turtlesim.msg.Pose,
                     handle_turtle_pose)
    rospy.spin()