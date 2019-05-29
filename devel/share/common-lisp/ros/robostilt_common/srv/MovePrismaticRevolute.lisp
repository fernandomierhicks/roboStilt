; Auto-generated. Do not edit!


(cl:in-package robostilt_common-srv)


;//! \htmlinclude MovePrismaticRevolute-request.msg.html

(cl:defclass <MovePrismaticRevolute-request> (roslisp-msg-protocol:ros-message)
  ((frame
    :reader frame
    :initarg :frame
    :type cl:integer
    :initform 0)
   (position
    :reader position
    :initarg :position
    :type cl:float
    :initform 0.0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass MovePrismaticRevolute-request (<MovePrismaticRevolute-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovePrismaticRevolute-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovePrismaticRevolute-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<MovePrismaticRevolute-request> is deprecated: use robostilt_common-srv:MovePrismaticRevolute-request instead.")))

(cl:ensure-generic-function 'frame-val :lambda-list '(m))
(cl:defmethod frame-val ((m <MovePrismaticRevolute-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:frame-val is deprecated.  Use robostilt_common-srv:frame instead.")
  (frame m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <MovePrismaticRevolute-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:position-val is deprecated.  Use robostilt_common-srv:position instead.")
  (position m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <MovePrismaticRevolute-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:angle-val is deprecated.  Use robostilt_common-srv:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovePrismaticRevolute-request>) ostream)
  "Serializes a message object of type '<MovePrismaticRevolute-request>"
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
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovePrismaticRevolute-request>) istream)
  "Deserializes a message object of type '<MovePrismaticRevolute-request>"
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovePrismaticRevolute-request>)))
  "Returns string type for a service object of type '<MovePrismaticRevolute-request>"
  "robostilt_common/MovePrismaticRevoluteRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovePrismaticRevolute-request)))
  "Returns string type for a service object of type 'MovePrismaticRevolute-request"
  "robostilt_common/MovePrismaticRevoluteRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovePrismaticRevolute-request>)))
  "Returns md5sum for a message object of type '<MovePrismaticRevolute-request>"
  "565c8a3a9e59566cc3f236fd9834581d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovePrismaticRevolute-request)))
  "Returns md5sum for a message object of type 'MovePrismaticRevolute-request"
  "565c8a3a9e59566cc3f236fd9834581d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovePrismaticRevolute-request>)))
  "Returns full string definition for message of type '<MovePrismaticRevolute-request>"
  (cl:format cl:nil "~%int32 frame~%float64 position~%float64 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovePrismaticRevolute-request)))
  "Returns full string definition for message of type 'MovePrismaticRevolute-request"
  (cl:format cl:nil "~%int32 frame~%float64 position~%float64 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovePrismaticRevolute-request>))
  (cl:+ 0
     4
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovePrismaticRevolute-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MovePrismaticRevolute-request
    (cl:cons ':frame (frame msg))
    (cl:cons ':position (position msg))
    (cl:cons ':angle (angle msg))
))
;//! \htmlinclude MovePrismaticRevolute-response.msg.html

(cl:defclass <MovePrismaticRevolute-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MovePrismaticRevolute-response (<MovePrismaticRevolute-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovePrismaticRevolute-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovePrismaticRevolute-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<MovePrismaticRevolute-response> is deprecated: use robostilt_common-srv:MovePrismaticRevolute-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MovePrismaticRevolute-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:success-val is deprecated.  Use robostilt_common-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovePrismaticRevolute-response>) ostream)
  "Serializes a message object of type '<MovePrismaticRevolute-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovePrismaticRevolute-response>) istream)
  "Deserializes a message object of type '<MovePrismaticRevolute-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovePrismaticRevolute-response>)))
  "Returns string type for a service object of type '<MovePrismaticRevolute-response>"
  "robostilt_common/MovePrismaticRevoluteResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovePrismaticRevolute-response)))
  "Returns string type for a service object of type 'MovePrismaticRevolute-response"
  "robostilt_common/MovePrismaticRevoluteResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovePrismaticRevolute-response>)))
  "Returns md5sum for a message object of type '<MovePrismaticRevolute-response>"
  "565c8a3a9e59566cc3f236fd9834581d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovePrismaticRevolute-response)))
  "Returns md5sum for a message object of type 'MovePrismaticRevolute-response"
  "565c8a3a9e59566cc3f236fd9834581d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovePrismaticRevolute-response>)))
  "Returns full string definition for message of type '<MovePrismaticRevolute-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovePrismaticRevolute-response)))
  "Returns full string definition for message of type 'MovePrismaticRevolute-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovePrismaticRevolute-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovePrismaticRevolute-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MovePrismaticRevolute-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MovePrismaticRevolute)))
  'MovePrismaticRevolute-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MovePrismaticRevolute)))
  'MovePrismaticRevolute-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovePrismaticRevolute)))
  "Returns string type for a service object of type '<MovePrismaticRevolute>"
  "robostilt_common/MovePrismaticRevolute")