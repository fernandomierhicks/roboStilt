#!/usr/bin/env python  

## This node gets the keyboard input from terminal as arrow presses and broadcasts that as a TF transform to "base_link" with respect to "world"



import roslib
roslib.load_manifest('robostilt_pkg')
import rospy

import tf


# Todo, how to know if TF listener is ready to hear the transform?

def publish_tf():
        rospy.init_node('tf_broadcasterFixedPosition')
        rate = rospy.Rate(10) # 10hz
        while not rospy.is_shutdown():

            #hello_str = "Published tf at time %s" % rospy.get_time()
            #rospy.loginfo(hello_str)

            br = tf.TransformBroadcaster()
            br.sendTransform((0, 0, 1.0),
                     tf.transformations.quaternion_from_euler(0, 0, 0),
                     rospy.Time.now(),
                     "base_link",
                     "world")
            rate.sleep() 

if __name__ == '__main__':
    try:
        publish_tf()
    except rospy.ROSInterruptException:
    pass

