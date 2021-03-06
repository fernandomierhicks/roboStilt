; Auto-generated. Do not edit!


(cl:in-package robostilt_common-msg)


;//! \htmlinclude SingleActuator.msg.html

(cl:defclass <SingleActuator> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (index
    :reader index
    :initarg :index
    :type cl:integer
    :initform 0)
   (position
    :reader position
    :initarg :position
    :type cl:float
    :initform 0.0)
   (position_setpoint
    :reader position_setpoint
    :initarg :position_setpoint
    :type cl:float
    :initform 0.0)
   (position_goal
    :reader position_goal
    :initarg :position_goal
    :type cl:float
    :initform 0.0)
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:float
    :initform 0.0)
   (velocity_setpoint
    :reader velocity_setpoint
    :initarg :velocity_setpoint
    :type cl:float
    :initform 0.0)
   (effort
    :reader effort
    :initarg :effort
    :type cl:float
    :initform 0.0)
   (effort_limit_upper
    :reader effort_limit_upper
    :initarg :effort_limit_upper
    :type cl:float
    :initform 0.0)
   (effort_limit_lower
    :reader effort_limit_lower
    :initarg :effort_limit_lower
    :type cl:float
    :initform 0.0)
   (effort_fault_expected
    :reader effort_fault_expected
    :initarg :effort_fault_expected
    :type cl:float
    :initform 0.0)
   (manipulation
    :reader manipulation
    :initarg :manipulation
    :type cl:float
    :initform 0.0)
   (progress
    :reader progress
    :initarg :progress
    :type cl:float
    :initform 0.0)
   (is_moving
    :reader is_moving
    :initarg :is_moving
    :type cl:boolean
    :initform cl:nil)
   (is_ready
    :reader is_ready
    :initarg :is_ready
    :type cl:boolean
    :initform cl:nil)
   (has_been_homed
    :reader has_been_homed
    :initarg :has_been_homed
    :type cl:boolean
    :initform cl:nil)
   (is_supporting_weight
    :reader is_supporting_weight
    :initarg :is_supporting_weight
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SingleActuator (<SingleActuator>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SingleActuator>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SingleActuator)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robostilt_common-msg:<SingleActuator> is deprecated: use robostilt_common-msg:SingleActuator instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:name-val is deprecated.  Use robostilt_common-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'index-val :lambda-list '(m))
(cl:defmethod index-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:index-val is deprecated.  Use robostilt_common-msg:index instead.")
  (index m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:position-val is deprecated.  Use robostilt_common-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'position_setpoint-val :lambda-list '(m))
(cl:defmethod position_setpoint-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:position_setpoint-val is deprecated.  Use robostilt_common-msg:position_setpoint instead.")
  (position_setpoint m))

(cl:ensure-generic-function 'position_goal-val :lambda-list '(m))
(cl:defmethod position_goal-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:position_goal-val is deprecated.  Use robostilt_common-msg:position_goal instead.")
  (position_goal m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:velocity-val is deprecated.  Use robostilt_common-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'velocity_setpoint-val :lambda-list '(m))
(cl:defmethod velocity_setpoint-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:velocity_setpoint-val is deprecated.  Use robostilt_common-msg:velocity_setpoint instead.")
  (velocity_setpoint m))

(cl:ensure-generic-function 'effort-val :lambda-list '(m))
(cl:defmethod effort-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:effort-val is deprecated.  Use robostilt_common-msg:effort instead.")
  (effort m))

(cl:ensure-generic-function 'effort_limit_upper-val :lambda-list '(m))
(cl:defmethod effort_limit_upper-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:effort_limit_upper-val is deprecated.  Use robostilt_common-msg:effort_limit_upper instead.")
  (effort_limit_upper m))

(cl:ensure-generic-function 'effort_limit_lower-val :lambda-list '(m))
(cl:defmethod effort_limit_lower-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:effort_limit_lower-val is deprecated.  Use robostilt_common-msg:effort_limit_lower instead.")
  (effort_limit_lower m))

(cl:ensure-generic-function 'effort_fault_expected-val :lambda-list '(m))
(cl:defmethod effort_fault_expected-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:effort_fault_expected-val is deprecated.  Use robostilt_common-msg:effort_fault_expected instead.")
  (effort_fault_expected m))

(cl:ensure-generic-function 'manipulation-val :lambda-list '(m))
(cl:defmethod manipulation-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:manipulation-val is deprecated.  Use robostilt_common-msg:manipulation instead.")
  (manipulation m))

(cl:ensure-generic-function 'progress-val :lambda-list '(m))
(cl:defmethod progress-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:progress-val is deprecated.  Use robostilt_common-msg:progress instead.")
  (progress m))

(cl:ensure-generic-function 'is_moving-val :lambda-list '(m))
(cl:defmethod is_moving-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:is_moving-val is deprecated.  Use robostilt_common-msg:is_moving instead.")
  (is_moving m))

(cl:ensure-generic-function 'is_ready-val :lambda-list '(m))
(cl:defmethod is_ready-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:is_ready-val is deprecated.  Use robostilt_common-msg:is_ready instead.")
  (is_ready m))

(cl:ensure-generic-function 'has_been_homed-val :lambda-list '(m))
(cl:defmethod has_been_homed-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:has_been_homed-val is deprecated.  Use robostilt_common-msg:has_been_homed instead.")
  (has_been_homed m))

(cl:ensure-generic-function 'is_supporting_weight-val :lambda-list '(m))
(cl:defmethod is_supporting_weight-val ((m <SingleActuator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robostilt_common-msg:is_supporting_weight-val is deprecated.  Use robostilt_common-msg:is_supporting_weight instead.")
  (is_supporting_weight m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SingleActuator>) ostream)
  "Serializes a message object of type '<SingleActuator>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let* ((signed (cl:slot-value msg 'index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
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
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position_setpoint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position_goal))))
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
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocity_setpoint))))
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
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'effort_limit_upper))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'effort_limit_lower))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'effort_fault_expected))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'manipulation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'progress))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_moving) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_ready) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'has_been_homed) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_supporting_weight) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SingleActuator>) istream)
  "Deserializes a message object of type '<SingleActuator>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'index) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
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
    (cl:setf (cl:slot-value msg 'position_setpoint) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position_goal) (roslisp-utils:decode-double-float-bits bits)))
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
    (cl:setf (cl:slot-value msg 'velocity_setpoint) (roslisp-utils:decode-double-float-bits bits)))
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'effort_limit_upper) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'effort_limit_lower) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'effort_fault_expected) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'manipulation) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'progress) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'is_moving) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_ready) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'has_been_homed) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_supporting_weight) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SingleActuator>)))
  "Returns string type for a message object of type '<SingleActuator>"
  "robostilt_common/SingleActuator")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SingleActuator)))
  "Returns string type for a message object of type 'SingleActuator"
  "robostilt_common/SingleActuator")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SingleActuator>)))
  "Returns md5sum for a message object of type '<SingleActuator>"
  "e6916bddab2de3c4943df05029f6f5bc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SingleActuator)))
  "Returns md5sum for a message object of type 'SingleActuator"
  "e6916bddab2de3c4943df05029f6f5bc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SingleActuator>)))
  "Returns full string definition for message of type '<SingleActuator>"
  (cl:format cl:nil "# This is a message that holds extended data for a single actuator~%~%string  name~%int32   index~%~%float64 position~%float64 position_setpoint   #trajectorized setpoint TODO~%float64 position_goal       #long term goal~%~%float64 velocity~%float64 velocity_setpoint   #trajectorized velocity TODO~%~%float64 effort~%float64 effort_limit_upper~%float64 effort_limit_lower~%float64 effort_fault_expected~%~%~%float32 manipulation~%float32 progress~%~%bool is_moving~%bool is_ready~%bool has_been_homed~%bool is_supporting_weight~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SingleActuator)))
  "Returns full string definition for message of type 'SingleActuator"
  (cl:format cl:nil "# This is a message that holds extended data for a single actuator~%~%string  name~%int32   index~%~%float64 position~%float64 position_setpoint   #trajectorized setpoint TODO~%float64 position_goal       #long term goal~%~%float64 velocity~%float64 velocity_setpoint   #trajectorized velocity TODO~%~%float64 effort~%float64 effort_limit_upper~%float64 effort_limit_lower~%float64 effort_fault_expected~%~%~%float32 manipulation~%float32 progress~%~%bool is_moving~%bool is_ready~%bool has_been_homed~%bool is_supporting_weight~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SingleActuator>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
     8
     8
     8
     8
     8
     8
     8
     8
     8
     4
     4
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SingleActuator>))
  "Converts a ROS message object to a list"
  (cl:list 'SingleActuator
    (cl:cons ':name (name msg))
    (cl:cons ':index (index msg))
    (cl:cons ':position (position msg))
    (cl:cons ':position_setpoint (position_setpoint msg))
    (cl:cons ':position_goal (position_goal msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':velocity_setpoint (velocity_setpoint msg))
    (cl:cons ':effort (effort msg))
    (cl:cons ':effort_limit_upper (effort_limit_upper msg))
    (cl:cons ':effort_limit_lower (effort_limit_lower msg))
    (cl:cons ':effort_fault_expected (effort_fault_expected msg))
    (cl:cons ':manipulation (manipulation msg))
    (cl:cons ':progress (progress msg))
    (cl:cons ':is_moving (is_moving msg))
    (cl:cons ':is_ready (is_ready msg))
    (cl:cons ':has_been_homed (has_been_homed msg))
    (cl:cons ':is_supporting_weight (is_supporting_weight msg))
))
