import rospy
import math

def str_trunc(number): #truncates number to 4 decimal places
    return '%.4f'%(number)

def print_ros(message):
    rospy.loginfo(message)
    #print(message)

def wait_for_user():
    pass
    #raw_input("Press Enter to continue...")

def str_time(time): #returns a string of seconds with decimals
    seconds=time.secs
    nanoseconds=time.nsecs
    return str(seconds+nanoseconds/1000000000.0)
