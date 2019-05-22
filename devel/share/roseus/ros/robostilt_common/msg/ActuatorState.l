;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::ActuatorState)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'ActuatorState (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::ACTUATORSTATE")
  (make-package "ROBOSTILT_COMMON::ACTUATORSTATE"))

(in-package "ROS")
;;//! \htmlinclude ActuatorState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*COUNT*" (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(shadow '*COUNT* (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(defconstant robostilt_common::ActuatorState::*COUNT* 8)
(intern "*PRISMATIC*" (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(shadow '*PRISMATIC* (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(defconstant robostilt_common::ActuatorState::*PRISMATIC* 0)
(intern "*LEG_1*" (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(shadow '*LEG_1* (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(defconstant robostilt_common::ActuatorState::*LEG_1* 1)
(intern "*LEG_2*" (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(shadow '*LEG_2* (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(defconstant robostilt_common::ActuatorState::*LEG_2* 2)
(intern "*LEG_3*" (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(shadow '*LEG_3* (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(defconstant robostilt_common::ActuatorState::*LEG_3* 3)
(intern "*LEG_4*" (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(shadow '*LEG_4* (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(defconstant robostilt_common::ActuatorState::*LEG_4* 4)
(intern "*LEG_5*" (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(shadow '*LEG_5* (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(defconstant robostilt_common::ActuatorState::*LEG_5* 5)
(intern "*LEG_6*" (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(shadow '*LEG_6* (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(defconstant robostilt_common::ActuatorState::*LEG_6* 6)
(intern "*REVOLUTE*" (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(shadow '*REVOLUTE* (find-package "ROBOSTILT_COMMON::ACTUATORSTATE"))
(defconstant robostilt_common::ActuatorState::*REVOLUTE* 7)
(defclass robostilt_common::ActuatorState
  :super ros::object
  :slots (_header _name _position _velocity _effort _effort_limit _position_setpoint _manipulation _progress _is_moving _is_ready _has_been_homed _is_supporting_weight _have_all_been_homed _all_are_ready ))

(defmethod robostilt_common::ActuatorState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:name __name) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:position __position) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:velocity __velocity) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:effort __effort) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:effort_limit __effort_limit) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:position_setpoint __position_setpoint) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:manipulation __manipulation) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:progress __progress) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:is_moving __is_moving) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:is_ready __is_ready) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:has_been_homed __has_been_homed) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:is_supporting_weight __is_supporting_weight) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:have_all_been_homed __have_all_been_homed) nil)
    ((:all_are_ready __all_are_ready) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _name __name)
   (setq _position __position)
   (setq _velocity __velocity)
   (setq _effort __effort)
   (setq _effort_limit __effort_limit)
   (setq _position_setpoint __position_setpoint)
   (setq _manipulation __manipulation)
   (setq _progress __progress)
   (setq _is_moving __is_moving)
   (setq _is_ready __is_ready)
   (setq _has_been_homed __has_been_homed)
   (setq _is_supporting_weight __is_supporting_weight)
   (setq _have_all_been_homed __have_all_been_homed)
   (setq _all_are_ready __all_are_ready)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:effort
   (&optional __effort)
   (if __effort (setq _effort __effort)) _effort)
  (:effort_limit
   (&optional __effort_limit)
   (if __effort_limit (setq _effort_limit __effort_limit)) _effort_limit)
  (:position_setpoint
   (&optional __position_setpoint)
   (if __position_setpoint (setq _position_setpoint __position_setpoint)) _position_setpoint)
  (:manipulation
   (&optional __manipulation)
   (if __manipulation (setq _manipulation __manipulation)) _manipulation)
  (:progress
   (&optional __progress)
   (if __progress (setq _progress __progress)) _progress)
  (:is_moving
   (&optional __is_moving)
   (if __is_moving (setq _is_moving __is_moving)) _is_moving)
  (:is_ready
   (&optional __is_ready)
   (if __is_ready (setq _is_ready __is_ready)) _is_ready)
  (:has_been_homed
   (&optional __has_been_homed)
   (if __has_been_homed (setq _has_been_homed __has_been_homed)) _has_been_homed)
  (:is_supporting_weight
   (&optional __is_supporting_weight)
   (if __is_supporting_weight (setq _is_supporting_weight __is_supporting_weight)) _is_supporting_weight)
  (:have_all_been_homed
   (&optional __have_all_been_homed)
   (if __have_all_been_homed (setq _have_all_been_homed __have_all_been_homed)) _have_all_been_homed)
  (:all_are_ready
   (&optional __all_are_ready)
   (if __all_are_ready (setq _all_are_ready __all_are_ready)) _all_are_ready)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string[] _name
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _name)) 4
    ;; float64[] _position
    (* 8    (length _position)) 4
    ;; float64[] _velocity
    (* 8    (length _velocity)) 4
    ;; float64[] _effort
    (* 8    (length _effort)) 4
    ;; float64[] _effort_limit
    (* 8    (length _effort_limit)) 4
    ;; float64[] _position_setpoint
    (* 8    (length _position_setpoint)) 4
    ;; float32[] _manipulation
    (* 4    (length _manipulation)) 4
    ;; float32[] _progress
    (* 4    (length _progress)) 4
    ;; bool[] _is_moving
    (* 1    (length _is_moving)) 4
    ;; bool[] _is_ready
    (* 1    (length _is_ready)) 4
    ;; bool[] _has_been_homed
    (* 1    (length _has_been_homed)) 4
    ;; bool[] _is_supporting_weight
    (* 1    (length _is_supporting_weight)) 4
    ;; bool _have_all_been_homed
    1
    ;; bool _all_are_ready
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string[] _name
     (write-long (length _name) s)
     (dolist (elem _name)
       (write-long (length elem) s) (princ elem s)
       )
     ;; float64[] _position
     (write-long (length _position) s)
     (dotimes (i (length _position))
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _velocity
     (write-long (length _velocity) s)
     (dotimes (i (length _velocity))
       (sys::poke (elt _velocity i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _effort
     (write-long (length _effort) s)
     (dotimes (i (length _effort))
       (sys::poke (elt _effort i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _effort_limit
     (write-long (length _effort_limit) s)
     (dotimes (i (length _effort_limit))
       (sys::poke (elt _effort_limit i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _position_setpoint
     (write-long (length _position_setpoint) s)
     (dotimes (i (length _position_setpoint))
       (sys::poke (elt _position_setpoint i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float32[] _manipulation
     (write-long (length _manipulation) s)
     (dotimes (i (length _manipulation))
       (sys::poke (elt _manipulation i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _progress
     (write-long (length _progress) s)
     (dotimes (i (length _progress))
       (sys::poke (elt _progress i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; bool[] _is_moving
     (write-long (length _is_moving) s)
     (dotimes (i (length _is_moving))
       (if (elt _is_moving i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; bool[] _is_ready
     (write-long (length _is_ready) s)
     (dotimes (i (length _is_ready))
       (if (elt _is_ready i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; bool[] _has_been_homed
     (write-long (length _has_been_homed) s)
     (dotimes (i (length _has_been_homed))
       (if (elt _has_been_homed i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; bool[] _is_supporting_weight
     (write-long (length _is_supporting_weight) s)
     (dotimes (i (length _is_supporting_weight))
       (if (elt _is_supporting_weight i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; bool _have_all_been_homed
       (if _have_all_been_homed (write-byte -1 s) (write-byte 0 s))
     ;; bool _all_are_ready
       (if _all_are_ready (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string[] _name
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _name (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _name i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; float64[] _position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _position (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _position i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _velocity
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _velocity (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _velocity i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _effort
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _effort (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _effort i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _effort_limit
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _effort_limit (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _effort_limit i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _position_setpoint
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _position_setpoint (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _position_setpoint i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float32[] _manipulation
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _manipulation (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _manipulation i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _progress
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _progress (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _progress i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; bool[] _is_moving
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _is_moving (make-list n))
     (dotimes (i n)
     (setf (elt _is_moving i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; bool[] _is_ready
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _is_ready (make-list n))
     (dotimes (i n)
     (setf (elt _is_ready i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; bool[] _has_been_homed
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _has_been_homed (make-list n))
     (dotimes (i n)
     (setf (elt _has_been_homed i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; bool[] _is_supporting_weight
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _is_supporting_weight (make-list n))
     (dotimes (i n)
     (setf (elt _is_supporting_weight i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; bool _have_all_been_homed
     (setq _have_all_been_homed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _all_are_ready
     (setq _all_are_ready (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robostilt_common::ActuatorState :md5sum-) "acf4b6d30f12ebcdcb467bbc886f86be")
(setf (get robostilt_common::ActuatorState :datatype-) "robostilt_common/ActuatorState")
(setf (get robostilt_common::ActuatorState :definition-)
      "# This is a message that holds extended data of all actuators


# Power supply status constants
uint8 COUNT=8

uint8 PRISMATIC = 0
uint8 LEG_1 = 1
uint8 LEG_2 = 2
uint8 LEG_3 = 3
uint8 LEG_4 = 4
uint8 LEG_5 = 5
uint8 LEG_6 = 6
uint8 REVOLUTE = 7

Header header

string[] name
float64[] position
float64[] velocity
float64[] effort
float64[] effort_limit

float64[] position_setpoint
float32[] manipulation
float32[] progress

bool[] is_moving
bool[] is_ready
bool[] has_been_homed
bool[] is_supporting_weight

bool have_all_been_homed
bool all_are_ready



================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :robostilt_common/ActuatorState "acf4b6d30f12ebcdcb467bbc886f86be")


