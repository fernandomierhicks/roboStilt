#!/usr/bin/env python
import rospy
from gazebo_msgs.msg import LinkStates
import tf
from geometry_msgs.msg import QuaternionStamped


# Gets base_link level from Gazebo. Adds noise to measurement and publishes into /robostilt/safety/level
# Publishes alarm if level is more than X

class Level():
    # -------------------------------------------------------------------------------------------------------  GLOBALS
    rad_to_deg = (180.0/3.1416)
    publisher = None
    max_level_error = None
 # -------------------------------------------------------------------------------------------------------  CALLBACKS

    def _link_state_callback(self, msg):
        for i in range(0, len(msg.name)):
            if(msg.name[i] == "robostilt::base_link"):
                orientation_q = msg.pose[i].orientation
                # publish level info to topic
                message = QuaternionStamped()
                message.header.frame_id = "base_link"
                message.header.stamp = rospy.Time.now()
                message.quaternion = orientation_q
                self.publisher.publish(message)
                # Calculate euler angles
                orientation_list = [orientation_q.x,
                                    orientation_q.y, orientation_q.z, orientation_q.w]
                (roll_x, pitch_y, yaw_z) = tf.transformations.euler_from_quaternion(
                    orientation_list)
        if(abs(roll_x) > self.max_level_error or abs(pitch_y) > self.max_level_error):
            rospy.logerr("Level is out of range. Roll_x= " + str(roll_x *
                                                                 self.rad_to_deg) + " Pitch_y= " + str(pitch_y*self.rad_to_deg))
    # ---------------------------------------------------------------------------------------------------------  ROS

    def setup_ros_interface(self):
        # Variables
        rate = 50
        package_name = "safety"
        node_name = "level"
        # Node
        rospy.init_node(node_name, anonymous=False)
        self.ros_rate = rospy.Rate(rate)
        rospy.loginfo("Node robostilt/"+package_name +
                      "/" + node_name + " started.")
        # Publishers
        self.publisher = rospy.Publisher(
            '/robostilt/safety/level', QuaternionStamped, queue_size=1, latch=True)
        # Subscribers
        rospy.Subscriber("gazebo/link_states",
                         QuaternionStamped, self._link_state_callback)
        # Services

        # wait for...
        topic_name = "gazebo/link_states"
        rospy.loginfo("Waiting for message on topic " + topic_name + " ...")
        rospy.wait_for_message(topic_name, QuaternionStamped)

        # get parameters
        self.max_level_error = rospy.get_param(
            "robostilt/angles/leveling_max_error")

    # ---------------------------------------------------------------------------------------------------------  INIT
    def __init__(self):
        self.setup_ros_interface()


if __name__ == '__main__':
    try:
        level = Level()
        while not rospy.is_shutdown():
            rospy.spin()
    except rospy.ROSInterruptException:
        pass
