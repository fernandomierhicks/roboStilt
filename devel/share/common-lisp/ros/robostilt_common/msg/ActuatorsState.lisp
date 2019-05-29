; Auto-generated. Do not edit!


(cl:in-package robostilt_common-msg)


;//! \htmlinclude ActuatorsState.msg.html

(cl:defclass <ActuatorsState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (actuators
    :reader actuators
    :initarg :actuators
    :type (cl:vector robostilt_common-msg:SingleActuator)
   :initform (cl:make-array 0 :element-type 'robostilt_common-msg:SingleActuator :initial-element (cl:make-instance 'robostilt_common-msg:SingleActuator)))
   (have_all_been_homed
    :reader have_all_been_homed
    :initarg :have_all_been_homed
    :type cl:boolean
    :initform cl:nil)
   (all_are_ready
    :reader all_are_ready
    :initarg :all_are_ready
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ActuatorsState (<ActuatorsState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActuatorsState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActuatorsState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-msg:<ActuatorsState> is deprecated: use robostilt_common-msg:ActuatorsState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ActuatorsState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:header-val is deprecated.  Use robostilt_common-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'actuators-val :lambda-list '(m))
(cl:defmethod actuators-val ((m <ActuatorsState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:actuators-val is deprecated.  Use robostilt_common-msg:actuators instead.")
  (actuators m))

(cl:ensure-generic-function 'have_all_been_homed-val :lambda-list '(m))
(cl:defmethod have_all_been_homed-val ((m <ActuatorsState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:have_all_been_homed-val is deprecated.  Use robostilt_common-msg:have_all_been_homed instead.")
  (have_all_been_homed m))

(cl:ensure-generic-function 'all_are_ready-val :lambda-list '(m))
(cl:defmethod all_are_ready-val ((m <ActuatorsState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:all_are_ready-val is deprecated.  Use robostilt_common-msg:all_are_ready instead.")
  (all_are_ready m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ActuatorsState>)))
    "Constants for message type '<ActuatorsState>"
  '((:COUNT . 8)
    (:THIRD_FRAME_PRISMATIC . 0)
    (:LEG_1 . 1)
    (:LEG_2 . 2)
    (:LEG_3 . 3)
    (:LEG_4 . 4)
    (:LEG_5 . 5)
    (:LEG_6 . 6)
    (:THIRD_FRAME_REVOLUTE . 7)
    (:ABS . True)
    (:REL . False))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ActuatorsState)))
    "Constants for message type 'ActuatorsState"
  '((:COUNT . 8)
    (:THIRD_FRAME_PRISMATIC . 0)
    (:LEG_1 . 1)
    (:LEG_2 . 2)
    (:LEG_3 . 3)
    (:LEG_4 . 4)
    (:LEG_5 . 5)
    (:LEG_6 . 6)
    (:THIRD_FRAME_REVOLUTE . 7)
    (:ABS . True)
    (:REL . False))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActuatorsState>) ostream)
  "Serializes a message object of type '<ActuatorsState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'actuators))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'actuators))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'have_all_been_homed) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'all_are_ready) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActuatorsState>) istream)
  "Deserializes a message object of type '<ActuatorsState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'actuators) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'actuators)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'robostilt_common-msg:SingleActuator))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:setf (cl:slot-value msg 'have_all_been_homed) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'all_are_ready) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ActuatorsState>)))
  "Returns string type for a message object of type '<ActuatorsState>"
  "robostilt_common/ActuatorsState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActuatorsState)))
  "Returns string type for a message object of type 'ActuatorsState"
  "robostilt_common/ActuatorsState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ActuatorsState>)))
  "Returns md5sum for a message object of type '<ActuatorsState>"
  "7026e9a150e20fe0ee17ebe9f4258d15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActuatorsState)))
  "Returns md5sum for a message object of type 'ActuatorsState"
  "7026e9a150e20fe0ee17ebe9f4258d15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActuatorsState>)))
  "Returns full string definition for message of type '<ActuatorsState>"
  (cl:format cl:nil "# This is a message that holds the state of all actuators as an array.~%~%uint8 COUNT=8~%uint8 THIRD_FRAME_PRISMATIC = 0~%uint8 LEG_1 = 1~%uint8 LEG_2 = 2~%uint8 LEG_3 = 3~%uint8 LEG_4 = 4~%uint8 LEG_5 = 5~%uint8 LEG_6 = 6~%uint8 THIRD_FRAME_REVOLUTE = 7~%~%bool ABS=True~%bool REL=False~%~%~%Header header~%~%SingleActuator[] actuators~%bool have_all_been_homed~%bool all_are_ready~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: robostilt_common/SingleActuator~%# This is a message that holds extended data for a single actuator~%~%string  name~%int32   index~%~%float64 position~%float64 position_setpoint   #trajectorized setpoint TODO~%float64 position_goal       #long term goal~%~%float64 velocity~%float64 velocity_setpoint   #trajectorized velocity TODO~%~%float64 effort~%float64 effort_limit_upper~%float64 effort_limit_lower~%float64 effort_fault_expected~%~%~%float32 manipulation~%float32 progress~%~%bool is_moving~%bool is_ready~%bool has_been_homed~%bool is_supporting_weight~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActuatorsState)))
  "Returns full string definition for message of type 'ActuatorsState"
  (cl:format cl:nil "# This is a message that holds the state of all actuators as an array.~%~%uint8 COUNT=8~%uint8 THIRD_FRAME_PRISMATIC = 0~%uint8 LEG_1 = 1~%uint8 LEG_2 = 2~%uint8 LEG_3 = 3~%uint8 LEG_4 = 4~%uint8 LEG_5 = 5~%uint8 LEG_6 = 6~%uint8 THIRD_FRAME_REVOLUTE = 7~%~%bool ABS=True~%bool REL=False~%~%~%Header header~%~%SingleActuator[] actuators~%bool have_all_been_homed~%bool all_are_ready~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: robostilt_common/SingleActuator~%# This is a message that holds extended data for a single actuator~%~%string  name~%int32   index~%~%float64 position~%float64 position_setpoint   #trajectorized setpoint TODO~%float64 position_goal       #long term goal~%~%float64 velocity~%float64 velocity_setpoint   #trajectorized velocity TODO~%~%float64 effort~%float64 effort_limit_upper~%float64 effort_limit_lower~%float64 effort_fault_expected~%~%~%float32 manipulation~%float32 progress~%~%bool is_moving~%bool is_ready~%bool has_been_homed~%bool is_supporting_weight~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActuatorsState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'actuators) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActuatorsState>))
  "Converts a ROS message object to a list"
  (cl:list 'ActuatorsState
    (cl:cons ':header (header msg))
    (cl:cons ':actuators (actuators msg))
    (cl:cons ':have_all_been_homed (have_all_been_homed msg))
    (cl:cons ':all_are_ready (all_are_ready msg))
))
