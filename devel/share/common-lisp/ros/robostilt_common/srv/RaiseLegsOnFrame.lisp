; Auto-generated. Do not edit!


(cl:in-package robostilt_common-srv)


;//! \htmlinclude RaiseLegsOnFrame-request.msg.html

(cl:defclass <RaiseLegsOnFrame-request> (roslisp-msg-protocol:ros-message)
  ((frame
    :reader frame
    :initarg :frame
    :type cl:integer
    :initform 0)
   (position
    :reader position
    :initarg :position
    :type cl:float
    :initform 0.0))
)

(cl:defclass RaiseLegsOnFrame-request (<RaiseLegsOnFrame-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RaiseLegsOnFrame-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RaiseLegsOnFrame-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<RaiseLegsOnFrame-request> is deprecated: use robostilt_common-srv:RaiseLegsOnFrame-request instead.")))

(cl:ensure-generic-function 'frame-val :lambda-list '(m))
(cl:defmethod frame-val ((m <RaiseLegsOnFrame-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:frame-val is deprecated.  Use robostilt_common-srv:frame instead.")
  (frame m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <RaiseLegsOnFrame-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:position-val is deprecated.  Use robostilt_common-srv:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RaiseLegsOnFrame-request>) ostream)
  "Serializes a message object of type '<RaiseLegsOnFrame-request>"
  (cl:let* ((signed (cl:slot-value msg 'frame)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RaiseLegsOnFrame-request>) istream)
  "Deserializes a message object of type '<RaiseLegsOnFrame-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frame) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RaiseLegsOnFrame-request>)))
  "Returns string type for a service object of type '<RaiseLegsOnFrame-request>"
  "robostilt_common/RaiseLegsOnFrameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RaiseLegsOnFrame-request)))
  "Returns string type for a service object of type 'RaiseLegsOnFrame-request"
  "robostilt_common/RaiseLegsOnFrameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RaiseLegsOnFrame-request>)))
  "Returns md5sum for a message object of type '<RaiseLegsOnFrame-request>"
  "b8d63a087f5948862a72cd21437ca0f9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RaiseLegsOnFrame-request)))
  "Returns md5sum for a message object of type 'RaiseLegsOnFrame-request"
  "b8d63a087f5948862a72cd21437ca0f9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RaiseLegsOnFrame-request>)))
  "Returns full string definition for message of type '<RaiseLegsOnFrame-request>"
  (cl:format cl:nil "int32 frame~%float64 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RaiseLegsOnFrame-request)))
  "Returns full string definition for message of type 'RaiseLegsOnFrame-request"
  (cl:format cl:nil "int32 frame~%float64 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RaiseLegsOnFrame-request>))
  (cl:+ 0
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RaiseLegsOnFrame-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RaiseLegsOnFrame-request
    (cl:cons ':frame (frame msg))
    (cl:cons ':position (position msg))
))
;//! \htmlinclude RaiseLegsOnFrame-response.msg.html

(cl:defclass <RaiseLegsOnFrame-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RaiseLegsOnFrame-response (<RaiseLegsOnFrame-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RaiseLegsOnFrame-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RaiseLegsOnFrame-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<RaiseLegsOnFrame-response> is deprecated: use robostilt_common-srv:RaiseLegsOnFrame-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <RaiseLegsOnFrame-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:success-val is deprecated.  Use robostilt_common-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RaiseLegsOnFrame-response>) ostream)
  "Serializes a message object of type '<RaiseLegsOnFrame-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RaiseLegsOnFrame-response>) istream)
  "Deserializes a message object of type '<RaiseLegsOnFrame-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RaiseLegsOnFrame-response>)))
  "Returns string type for a service object of type '<RaiseLegsOnFrame-response>"
  "robostilt_common/RaiseLegsOnFrameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RaiseLegsOnFrame-response)))
  "Returns string type for a service object of type 'RaiseLegsOnFrame-response"
  "robostilt_common/RaiseLegsOnFrameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RaiseLegsOnFrame-response>)))
  "Returns md5sum for a message object of type '<RaiseLegsOnFrame-response>"
  "b8d63a087f5948862a72cd21437ca0f9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RaiseLegsOnFrame-response)))
  "Returns md5sum for a message object of type 'RaiseLegsOnFrame-response"
  "b8d63a087f5948862a72cd21437ca0f9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RaiseLegsOnFrame-response>)))
  "Returns full string definition for message of type '<RaiseLegsOnFrame-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RaiseLegsOnFrame-response)))
  "Returns full string definition for message of type 'RaiseLegsOnFrame-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RaiseLegsOnFrame-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RaiseLegsOnFrame-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RaiseLegsOnFrame-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RaiseLegsOnFrame)))
  'RaiseLegsOnFrame-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RaiseLegsOnFrame)))
  'RaiseLegsOnFrame-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RaiseLegsOnFrame)))
  "Returns string type for a service object of type '<RaiseLegsOnFrame>"
  "robostilt_common/RaiseLegsOnFrame")