;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::ActuatorState)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'ActuatorState (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::ACTUATORSTATE")
  (make-package "ROBOSTILT_COMMON::ACTUATORSTATE"))

(in-package "ROS")
;;//! \htmlinclude ActuatorState.msg.html


(defclass robostilt_common::ActuatorState
  :super ros::object
  :slots (_name _index _position _position_setpoint _position_goal _velocity _velocity_setpoint _effort _effort_limit _manipulation _progress _is_moving _is_ready _has_been_homed _is_supporting_weight ))

(defmethod robostilt_common::ActuatorState
  (:init
   (&key
    ((:name __name) "")
    ((:index __index) 0)
    ((:position __position) 0.0)
    ((:position_setpoint __position_setpoint) 0.0)
    ((:position_goal __position_goal) 0.0)
    ((:velocity __velocity) 0.0)
    ((:velocity_setpoint __velocity_setpoint) 0.0)
    ((:effort __effort) 0.0)
    ((:effort_limit __effort_limit) 0.0)
    ((:manipulation __manipulation) 0.0)
    ((:progress __progress) 0.0)
    ((:is_moving __is_moving) nil)
    ((:is_ready __is_ready) nil)
    ((:has_been_homed __has_been_homed) nil)
    ((:is_supporting_weight __is_supporting_weight) nil)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _index (round __index))
   (setq _position (float __position))
   (setq _position_setpoint (float __position_setpoint))
   (setq _position_goal (float __position_goal))
   (setq _velocity (float __velocity))
   (setq _velocity_setpoint (float __velocity_setpoint))
   (setq _effort (float __effort))
   (setq _effort_limit (float __effort_limit))
   (setq _manipulation (float __manipulation))
   (setq _progress (float __progress))
   (setq _is_moving __is_moving)
   (setq _is_ready __is_ready)
   (setq _has_been_homed __has_been_homed)
   (setq _is_supporting_weight __is_supporting_weight)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:index
   (&optional __index)
   (if __index (setq _index __index)) _index)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:position_setpoint
   (&optional __position_setpoint)
   (if __position_setpoint (setq _position_setpoint __position_setpoint)) _position_setpoint)
  (:position_goal
   (&optional __position_goal)
   (if __position_goal (setq _position_goal __position_goal)) _position_goal)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:velocity_setpoint
   (&optional __velocity_setpoint)
   (if __velocity_setpoint (setq _velocity_setpoint __velocity_setpoint)) _velocity_setpoint)
  (:effort
   (&optional __effort)
   (if __effort (setq _effort __effort)) _effort)
  (:effort_limit
   (&optional __effort_limit)
   (if __effort_limit (setq _effort_limit __effort_limit)) _effort_limit)
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
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; int32 _index
    4
    ;; float64 _position
    8
    ;; float64 _position_setpoint
    8
    ;; float64 _position_goal
    8
    ;; float64 _velocity
    8
    ;; float64 _velocity_setpoint
    8
    ;; float64 _effort
    8
    ;; float64 _effort_limit
    8
    ;; float32 _manipulation
    4
    ;; float32 _progress
    4
    ;; bool _is_moving
    1
    ;; bool _is_ready
    1
    ;; bool _has_been_homed
    1
    ;; bool _is_supporting_weight
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; int32 _index
       (write-long _index s)
     ;; float64 _position
       (sys::poke _position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_setpoint
       (sys::poke _position_setpoint (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_goal
       (sys::poke _position_goal (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_setpoint
       (sys::poke _velocity_setpoint (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _effort
       (sys::poke _effort (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _effort_limit
       (sys::poke _effort_limit (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _manipulation
       (sys::poke _manipulation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _progress
       (sys::poke _progress (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _is_moving
       (if _is_moving (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_ready
       (if _is_ready (write-byte -1 s) (write-byte 0 s))
     ;; bool _has_been_homed
       (if _has_been_homed (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_supporting_weight
       (if _is_supporting_weight (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _index
     (setq _index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _position
     (setq _position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_setpoint
     (setq _position_setpoint (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_goal
     (setq _position_goal (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity
     (setq _velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_setpoint
     (setq _velocity_setpoint (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _effort
     (setq _effort (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _effort_limit
     (setq _effort_limit (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _manipulation
     (setq _manipulation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _progress
     (setq _progress (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _is_moving
     (setq _is_moving (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_ready
     (setq _is_ready (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _has_been_homed
     (setq _has_been_homed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_supporting_weight
     (setq _is_supporting_weight (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robostilt_common::ActuatorState :md5sum-) "c8adcf30a4a8d2cd998962d19cef108a")
(setf (get robostilt_common::ActuatorState :datatype-) "robostilt_common/ActuatorState")
(setf (get robostilt_common::ActuatorState :definition-)
      "# This is a message that holds extended data for a single actuator

string  name
int32   index

float64 position
float64 position_setpoint   #trajectorized setpoint
float64 position_goal       #long term goal

float64 velocity
float64 velocity_setpoint   #trajectorized velocity

float64 effort
float64 effort_limit


float32 manipulation
float32 progress

bool is_moving
bool is_ready
bool has_been_homed
bool is_supporting_weight





")



(provide :robostilt_common/ActuatorState "c8adcf30a4a8d2cd998962d19cef108a")


