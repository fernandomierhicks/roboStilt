; Auto-generated. Do not edit!


(cl:in-package robostilt_common-srv)


;//! \htmlinclude MovePrismatic-request.msg.html

(cl:defclass <MovePrismatic-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass MovePrismatic-request (<MovePrismatic-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovePrismatic-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovePrismatic-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<MovePrismatic-request> is deprecated: use robostilt_common-srv:MovePrismatic-request instead.")))

(cl:ensure-generic-function 'frame-val :lambda-list '(m))
(cl:defmethod frame-val ((m <MovePrismatic-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:frame-val is deprecated.  Use robostilt_common-srv:frame instead.")
  (frame m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <MovePrismatic-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:position-val is deprecated.  Use robostilt_common-srv:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovePrismatic-request>) ostream)
  "Serializes a message object of type '<MovePrismatic-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovePrismatic-request>) istream)
  "Deserializes a message object of type '<MovePrismatic-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovePrismatic-request>)))
  "Returns string type for a service object of type '<MovePrismatic-request>"
  "robostilt_common/MovePrismaticRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovePrismatic-request)))
  "Returns string type for a service object of type 'MovePrismatic-request"
  "robostilt_common/MovePrismaticRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovePrismatic-request>)))
  "Returns md5sum for a message object of type '<MovePrismatic-request>"
  "b8d63a087f5948862a72cd21437ca0f9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovePrismatic-request)))
  "Returns md5sum for a message object of type 'MovePrismatic-request"
  "b8d63a087f5948862a72cd21437ca0f9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovePrismatic-request>)))
  "Returns full string definition for message of type '<MovePrismatic-request>"
  (cl:format cl:nil "~%int32 frame~%float64 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovePrismatic-request)))
  "Returns full string definition for message of type 'MovePrismatic-request"
  (cl:format cl:nil "~%int32 frame~%float64 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovePrismatic-request>))
  (cl:+ 0
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovePrismatic-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MovePrismatic-request
    (cl:cons ':frame (frame msg))
    (cl:cons ':position (position msg))
))
;//! \htmlinclude MovePrismatic-response.msg.html

(cl:defclass <MovePrismatic-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MovePrismatic-response (<MovePrismatic-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovePrismatic-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovePrismatic-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<MovePrismatic-response> is deprecated: use robostilt_common-srv:MovePrismatic-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MovePrismatic-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:success-val is deprecated.  Use robostilt_common-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovePrismatic-response>) ostream)
  "Serializes a message object of type '<MovePrismatic-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovePrismatic-response>) istream)
  "Deserializes a message object of type '<MovePrismatic-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovePrismatic-response>)))
  "Returns string type for a service object of type '<MovePrismatic-response>"
  "robostilt_common/MovePrismaticResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovePrismatic-response)))
  "Returns string type for a service object of type 'MovePrismatic-response"
  "robostilt_common/MovePrismaticResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovePrismatic-response>)))
  "Returns md5sum for a message object of type '<MovePrismatic-response>"
  "b8d63a087f5948862a72cd21437ca0f9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovePrismatic-response)))
  "Returns md5sum for a message object of type 'MovePrismatic-response"
  "b8d63a087f5948862a72cd21437ca0f9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovePrismatic-response>)))
  "Returns full string definition for message of type '<MovePrismatic-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovePrismatic-response)))
  "Returns full string definition for message of type 'MovePrismatic-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovePrismatic-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovePrismatic-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MovePrismatic-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MovePrismatic)))
  'MovePrismatic-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MovePrismatic)))
  'MovePrismatic-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovePrismatic)))
  "Returns string type for a service object of type '<MovePrismatic>"
  "robostilt_common/MovePrismatic")