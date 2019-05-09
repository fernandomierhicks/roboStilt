import rospy

def print_ros(message):
    rospy.loginfo(message)
    #print(message)

def wait_for_user():
    #pass
    raw_input("Press Enter to continue...")