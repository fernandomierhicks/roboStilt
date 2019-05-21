#!/usr/bin/env python

import sys
import rospy
from std_srvs.srv import Empty 


if __name__ == "__main__":
    print(len(sys.argv))
    rospy.loginfo(len(sys.argv))

    if len(sys.argv) == 2:
        serviceName = str(sys.argv[1])       
        rospy.wait_for_service(serviceName)
        print("Waiting for service: " +serviceName +"... ")
        try:
            rospy.ServiceProxy(serviceName, Empty)
            print("Call to: " +serviceName +"COMPLETED")
        except:
            print("Call to: " +serviceName +"FAILED")
    else:
        print "Wrong number of argumetns passed"
        sys.exit(1)
