; Auto-generated. Do not edit!


(cl:in-package robostilt_common-srv)


;//! \htmlinclude StepForward-request.msg.html

(cl:defclass <StepForward-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass StepForward-request (<StepForward-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StepForward-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StepForward-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<StepForward-request> is deprecated: use robostilt_common-srv:StepForward-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StepForward-request>) ostream)
  "Serializes a message object of type '<StepForward-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StepForward-request>) istream)
  "Deserializes a message object of type '<StepForward-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StepForward-request>)))
  "Returns string type for a service object of type '<StepForward-request>"
  "robostilt_common/StepForwardRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StepForward-request)))
  "Returns string type for a service object of type 'StepForward-request"
  "robostilt_common/StepForwardRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StepForward-request>)))
  "Returns md5sum for a message object of type '<StepForward-request>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StepForward-request)))
  "Returns md5sum for a message object of type 'StepForward-request"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StepForward-request>)))
  "Returns full string definition for message of type '<StepForward-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StepForward-request)))
  "Returns full string definition for message of type 'StepForward-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StepForward-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StepForward-request>))
  "Converts a ROS message object to a list"
  (cl:list 'StepForward-request
))
;//! \htmlinclude StepForward-response.msg.html

(cl:defclass <StepForward-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass StepForward-response (<StepForward-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StepForward-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StepForward-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<StepForward-response> is deprecated: use robostilt_common-srv:StepForward-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <StepForward-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:success-val is deprecated.  Use robostilt_common-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StepForward-response>) ostream)
  "Serializes a message object of type '<StepForward-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StepForward-response>) istream)
  "Deserializes a message object of type '<StepForward-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StepForward-response>)))
  "Returns string type for a service object of type '<StepForward-response>"
  "robostilt_common/StepForwardResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StepForward-response)))
  "Returns string type for a service object of type 'StepForward-response"
  "robostilt_common/StepForwardResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StepForward-response>)))
  "Returns md5sum for a message object of type '<StepForward-response>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StepForward-response)))
  "Returns md5sum for a message object of type 'StepForward-response"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StepForward-response>)))
  "Returns full string definition for message of type '<StepForward-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StepForward-response)))
  "Returns full string definition for message of type 'StepForward-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StepForward-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StepForward-response>))
  "Converts a ROS message object to a list"
  (cl:list 'StepForward-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'StepForward)))
  'StepForward-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'StepForward)))
  'StepForward-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StepForward)))
  "Returns string type for a service object of type '<StepForward>"
  "robostilt_common/StepForward")