; Auto-generated. Do not edit!


(cl:in-package robostilt_common-srv)


;//! \htmlinclude LowerLegsOnFrame-request.msg.html

(cl:defclass <LowerLegsOnFrame-request> (roslisp-msg-protocol:ros-message)
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
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:float
    :initform 0.0)
   (effort
    :reader effort
    :initarg :effort
    :type cl:float
    :initform 0.0))
)

(cl:defclass LowerLegsOnFrame-request (<LowerLegsOnFrame-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LowerLegsOnFrame-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LowerLegsOnFrame-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<LowerLegsOnFrame-request> is deprecated: use robostilt_common-srv:LowerLegsOnFrame-request instead.")))

(cl:ensure-generic-function 'frame-val :lambda-list '(m))
(cl:defmethod frame-val ((m <LowerLegsOnFrame-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:frame-val is deprecated.  Use robostilt_common-srv:frame instead.")
  (frame m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <LowerLegsOnFrame-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:position-val is deprecated.  Use robostilt_common-srv:position instead.")
  (position m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <LowerLegsOnFrame-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:velocity-val is deprecated.  Use robostilt_common-srv:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'effort-val :lambda-list '(m))
(cl:defmethod effort-val ((m <LowerLegsOnFrame-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:effort-val is deprecated.  Use robostilt_common-srv:effort instead.")
  (effort m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LowerLegsOnFrame-request>) ostream)
  "Serializes a message object of type '<LowerLegsOnFrame-request>"
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
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LowerLegsOnFrame-request>) istream)
  "Deserializes a message object of type '<LowerLegsOnFrame-request>"
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
    (cl:setf (cl:slot-value msg 'velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'effort) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LowerLegsOnFrame-request>)))
  "Returns string type for a service object of type '<LowerLegsOnFrame-request>"
  "robostilt_common/LowerLegsOnFrameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LowerLegsOnFrame-request)))
  "Returns string type for a service object of type 'LowerLegsOnFrame-request"
  "robostilt_common/LowerLegsOnFrameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LowerLegsOnFrame-request>)))
  "Returns md5sum for a message object of type '<LowerLegsOnFrame-request>"
  "62c1b1b14c2ae58036a5a019416e2f57")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LowerLegsOnFrame-request)))
  "Returns md5sum for a message object of type 'LowerLegsOnFrame-request"
  "62c1b1b14c2ae58036a5a019416e2f57")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LowerLegsOnFrame-request>)))
  "Returns full string definition for message of type '<LowerLegsOnFrame-request>"
  (cl:format cl:nil "~%int32 frame~%float64 position~%float64 velocity~%float64 effort~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LowerLegsOnFrame-request)))
  "Returns full string definition for message of type 'LowerLegsOnFrame-request"
  (cl:format cl:nil "~%int32 frame~%float64 position~%float64 velocity~%float64 effort~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LowerLegsOnFrame-request>))
  (cl:+ 0
     4
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LowerLegsOnFrame-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LowerLegsOnFrame-request
    (cl:cons ':frame (frame msg))
    (cl:cons ':position (position msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':effort (effort msg))
))
;//! \htmlinclude LowerLegsOnFrame-response.msg.html

(cl:defclass <LowerLegsOnFrame-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LowerLegsOnFrame-response (<LowerLegsOnFrame-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LowerLegsOnFrame-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LowerLegsOnFrame-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-srv:<LowerLegsOnFrame-response> is deprecated: use robostilt_common-srv:LowerLegsOnFrame-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <LowerLegsOnFrame-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-srv:success-val is deprecated.  Use robostilt_common-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LowerLegsOnFrame-response>) ostream)
  "Serializes a message object of type '<LowerLegsOnFrame-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LowerLegsOnFrame-response>) istream)
  "Deserializes a message object of type '<LowerLegsOnFrame-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LowerLegsOnFrame-response>)))
  "Returns string type for a service object of type '<LowerLegsOnFrame-response>"
  "robostilt_common/LowerLegsOnFrameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LowerLegsOnFrame-response)))
  "Returns string type for a service object of type 'LowerLegsOnFrame-response"
  "robostilt_common/LowerLegsOnFrameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LowerLegsOnFrame-response>)))
  "Returns md5sum for a message object of type '<LowerLegsOnFrame-response>"
  "62c1b1b14c2ae58036a5a019416e2f57")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LowerLegsOnFrame-response)))
  "Returns md5sum for a message object of type 'LowerLegsOnFrame-response"
  "62c1b1b14c2ae58036a5a019416e2f57")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LowerLegsOnFrame-response>)))
  "Returns full string definition for message of type '<LowerLegsOnFrame-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LowerLegsOnFrame-response)))
  "Returns full string definition for message of type 'LowerLegsOnFrame-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LowerLegsOnFrame-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LowerLegsOnFrame-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LowerLegsOnFrame-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LowerLegsOnFrame)))
  'LowerLegsOnFrame-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LowerLegsOnFrame)))
  'LowerLegsOnFrame-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LowerLegsOnFrame)))
  "Returns string type for a service object of type '<LowerLegsOnFrame>"
  "robostilt_common/LowerLegsOnFrame")