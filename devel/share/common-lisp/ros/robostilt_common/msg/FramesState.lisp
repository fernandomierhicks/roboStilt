; Auto-generated. Do not edit!


(cl:in-package robostilt_common-msg)


;//! \htmlinclude FramesState.msg.html

(cl:defclass <FramesState> (roslisp-msg-protocol:ros-message)
  ((supporting_frame
    :reader supporting_frame
    :initarg :supporting_frame
    :type cl:fixnum
    :initform 0))
)

(cl:defclass FramesState (<FramesState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FramesState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FramesState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-msg:<FramesState> is deprecated: use robostilt_common-msg:FramesState instead.")))

(cl:ensure-generic-function 'supporting_frame-val :lambda-list '(m))
(cl:defmethod supporting_frame-val ((m <FramesState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:supporting_frame-val is deprecated.  Use robostilt_common-msg:supporting_frame instead.")
  (supporting_frame m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<FramesState>)))
    "Constants for message type '<FramesState>"
  '((:NONE . 0)
    (:ODD . 1)
    (:EVEN . 2)
    (:PRISMATIC . 3)
    (:REVOLUTE . 4)
    (:ODD_AND_EVEN . 5)
    (:PRISMATIC_AND_REVOLUTE . 6))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'FramesState)))
    "Constants for message type 'FramesState"
  '((:NONE . 0)
    (:ODD . 1)
    (:EVEN . 2)
    (:PRISMATIC . 3)
    (:REVOLUTE . 4)
    (:ODD_AND_EVEN . 5)
    (:PRISMATIC_AND_REVOLUTE . 6))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FramesState>) ostream)
  "Serializes a message object of type '<FramesState>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'supporting_frame)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FramesState>) istream)
  "Deserializes a message object of type '<FramesState>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'supporting_frame)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FramesState>)))
  "Returns string type for a message object of type '<FramesState>"
  "robostilt_common/FramesState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FramesState)))
  "Returns string type for a message object of type 'FramesState"
  "robostilt_common/FramesState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FramesState>)))
  "Returns md5sum for a message object of type '<FramesState>"
  "6960690b13db489543fcbbdcab8fcd47")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FramesState)))
  "Returns md5sum for a message object of type 'FramesState"
  "6960690b13db489543fcbbdcab8fcd47")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FramesState>)))
  "Returns full string definition for message of type '<FramesState>"
  (cl:format cl:nil "uint8 NONE=0~%uint8 ODD = 1~%uint8 EVEN = 2~%uint8 PRISMATIC = 3~%uint8 REVOLUTE = 4~%uint8 ODD_AND_EVEN = 5~%uint8 PRISMATIC_AND_REVOLUTE = 6~%~%uint8 supporting_frame~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FramesState)))
  "Returns full string definition for message of type 'FramesState"
  (cl:format cl:nil "uint8 NONE=0~%uint8 ODD = 1~%uint8 EVEN = 2~%uint8 PRISMATIC = 3~%uint8 REVOLUTE = 4~%uint8 ODD_AND_EVEN = 5~%uint8 PRISMATIC_AND_REVOLUTE = 6~%~%uint8 supporting_frame~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FramesState>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FramesState>))
  "Converts a ROS message object to a list"
  (cl:list 'FramesState
    (cl:cons ':supporting_frame (supporting_frame msg))
))
