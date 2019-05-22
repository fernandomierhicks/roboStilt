#!/usr/bin/env python
import rospy
from gazebo_msgs.msg import LinkStates
import tf
from geometry_msgs.msg import QuaternionStamped
# Gets base_link level from Gazebo. Adds noise to measurement
# Publishes alarm if level is more than X


rospy.init_node('safety_level', anonymous=True)

pub = rospy.Publisher('/robostilt/safety/level',
                      QuaternionStamped, queue_size=1, latch=True)


max_level_error = rospy.get_param("robostilt/angles/leveling_max_error")

rospy.loginfo("Starting looking out for level...")
rad_to_deg = (180.0/3.1416)


def _linkState_callback(data):
    roll_x = 0
    pitch_y = 0
    yaw_z = 0

    for i in range(0, len(data.name)):
        if(data.name[i] == "robostilt::base_link"):
            orientation_q = data.pose[i].orientation
            # publish level info to topic
            message = QuaternionStamped()
            message.header.frame_id = "base_link"
            message.header.stamp = rospy.Time.now()
            message.quaternion = orientation_q
            pub.publish(message)
            # Calculate euler angles
            orientation_list = [orientation_q.x,
                                orientation_q.y, orientation_q.z, orientation_q.w]
            (roll_x, pitch_y, yaw_z) = tf.transformations.euler_from_quaternion(
                orientation_list)
            #rospy.loginfo("roll_x= %s pitch_y= %s", roll_x , pitch_y)
    if(abs(roll_x) > max_level_error or abs(pitch_y) > max_level_error):
        rospy.logerr("Level is out of range. Roll_x= " + str(roll_x *
                                                             rad_to_deg) + " Pitch_y= " + str(pitch_y*rad_to_deg))


rospy.Subscriber("gazebo/link_states", LinkStates, _linkState_callback)
rospy.spin()


if __name__ == '__main__':
    try:
        Stability()
    except rospy.ROSInterruptException:
        pass
