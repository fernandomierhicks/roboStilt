; Auto-generated. Do not edit!


(cl:in-package robostilt_common-srv)


;//! \htmlinclude TriggerFault-request.msg.html

(cl:defclass <TriggerFault-request> (roslisp-msg-protocol:ros-message)
  ((fault_code
    :reader fault_code
    :initarg :fault_code
    :type cl:integer
    :initform 0))
)

(cl:defclass TriggerFault-request (<TriggerFault-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TriggerFault-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TriggerFault-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<TriggerFault-request> is deprecated: use robostilt_common-srv:TriggerFault-request instead.")))

(cl:ensure-generic-function 'fault_code-val :lambda-list '(m))
(cl:defmethod fault_code-val ((m <TriggerFault-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:fault_code-val is deprecated.  Use robostilt_common-srv:fault_code instead.")
  (fault_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TriggerFault-request>) ostream)
  "Serializes a message object of type '<TriggerFault-request>"
  (cl:let* ((signed (cl:slot-value msg 'fault_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TriggerFault-request>) istream)
  "Deserializes a message object of type '<TriggerFault-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fault_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TriggerFault-request>)))
  "Returns string type for a service object of type '<TriggerFault-request>"
  "robostilt_common/TriggerFaultRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TriggerFault-request)))
  "Returns string type for a service object of type 'TriggerFault-request"
  "robostilt_common/TriggerFaultRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TriggerFault-request>)))
  "Returns md5sum for a message object of type '<TriggerFault-request>"
  "48423ad27bada7cd9dea5c77b2e6e973")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TriggerFault-request)))
  "Returns md5sum for a message object of type 'TriggerFault-request"
  "48423ad27bada7cd9dea5c77b2e6e973")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TriggerFault-request>)))
  "Returns full string definition for message of type '<TriggerFault-request>"
  (cl:format cl:nil "int32 fault_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TriggerFault-request)))
  "Returns full string definition for message of type 'TriggerFault-request"
  (cl:format cl:nil "int32 fault_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TriggerFault-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TriggerFault-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TriggerFault-request
    (cl:cons ':fault_code (fault_code msg))
))
;//! \htmlinclude TriggerFault-response.msg.html

(cl:defclass <TriggerFault-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass TriggerFault-response (<TriggerFault-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TriggerFault-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TriggerFault-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<TriggerFault-response> is deprecated: use robostilt_common-srv:TriggerFault-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <TriggerFault-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:success-val is deprecated.  Use robostilt_common-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TriggerFault-response>) ostream)
  "Serializes a message object of type '<TriggerFault-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TriggerFault-response>) istream)
  "Deserializes a message object of type '<TriggerFault-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TriggerFault-response>)))
  "Returns string type for a service object of type '<TriggerFault-response>"
  "robostilt_common/TriggerFaultResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TriggerFault-response)))
  "Returns string type for a service object of type 'TriggerFault-response"
  "robostilt_common/TriggerFaultResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TriggerFault-response>)))
  "Returns md5sum for a message object of type '<TriggerFault-response>"
  "48423ad27bada7cd9dea5c77b2e6e973")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TriggerFault-response)))
  "Returns md5sum for a message object of type 'TriggerFault-response"
  "48423ad27bada7cd9dea5c77b2e6e973")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TriggerFault-response>)))
  "Returns full string definition for message of type '<TriggerFault-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TriggerFault-response)))
  "Returns full string definition for message of type 'TriggerFault-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TriggerFault-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TriggerFault-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TriggerFault-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TriggerFault)))
  'TriggerFault-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TriggerFault)))
  'TriggerFault-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TriggerFault)))
  "Returns string type for a service object of type '<TriggerFault>"
  "robostilt_common/TriggerFault")