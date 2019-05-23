#! /usr/bin/env python

import rospy
from robostilt_common.srv import LowerLegsOnFrameRequest
from robostilt_common.msg import FramesState

rospy.loginfo("STARTED")
request = LowerLegsOnFrameRequest()
request.frame = FramesState.EVEN
request.position = -1
request.velocity = 0.2
request.effort = 0

service_name = "robostilt/frames_state/lower_legs_on_frame"

rospy.loginfo("Waiting for service...")
# rospy.wait_for_service(service_name)
try:
    service_type = type(request)
    service = rospy.ServiceProxy(service_name, service_type)
    result = service_type(request)
except rospy.ServiceException, e:
    print "Service call failed: %s" % e
