;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::LowerLegsOnFrame)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'LowerLegsOnFrame (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::LOWERLEGSONFRAME")
  (make-package "ROBOSTILT_COMMON::LOWERLEGSONFRAME"))
(unless (find-package "ROBOSTILT_COMMON::LOWERLEGSONFRAMEREQUEST")
  (make-package "ROBOSTILT_COMMON::LOWERLEGSONFRAMEREQUEST"))
(unless (find-package "ROBOSTILT_COMMON::LOWERLEGSONFRAMERESPONSE")
  (make-package "ROBOSTILT_COMMON::LOWERLEGSONFRAMERESPONSE"))

(in-package "ROS")





(defclass robostilt_common::LowerLegsOnFrameRequest
  :super ros::object
  :slots (_frame _position _velocity _effort ))

(defmethod robostilt_common::LowerLegsOnFrameRequest
  (:init
   (&key
    ((:frame __frame) 0)
    ((:position __position) 0.0)
    ((:velocity __velocity) 0.0)
    ((:effort __effort) 0.0)
    )
   (send-super :init)
   (setq _frame (round __frame))
   (setq _position (float __position))
   (setq _velocity (float __velocity))
   (setq _effort (float __effort))
   self)
  (:frame
   (&optional __frame)
   (if __frame (setq _frame __frame)) _frame)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:effort
   (&optional __effort)
   (if __effort (setq _effort __effort)) _effort)
  (:serialization-length
   ()
   (+
    ;; int32 _frame
    4
    ;; float64 _position
    8
    ;; float64 _velocity
    8
    ;; float64 _effort
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _frame
       (write-long _frame s)
     ;; float64 _position
       (sys::poke _position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _effort
       (sys::poke _effort (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _frame
     (setq _frame (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _position
     (setq _position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity
     (setq _velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _effort
     (setq _effort (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass robostilt_common::LowerLegsOnFrameResponse
  :super ros::object
  :slots (_success ))

(defmethod robostilt_common::LowerLegsOnFrameResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robostilt_common::LowerLegsOnFrame
  :super ros::object
  :slots ())

(setf (get robostilt_common::LowerLegsOnFrame :md5sum-) "62c1b1b14c2ae58036a5a019416e2f57")
(setf (get robostilt_common::LowerLegsOnFrame :datatype-) "robostilt_common/LowerLegsOnFrame")
(setf (get robostilt_common::LowerLegsOnFrame :request) robostilt_common::LowerLegsOnFrameRequest)
(setf (get robostilt_common::LowerLegsOnFrame :response) robostilt_common::LowerLegsOnFrameResponse)

(defmethod robostilt_common::LowerLegsOnFrameRequest
  (:response () (instance robostilt_common::LowerLegsOnFrameResponse :init)))

(setf (get robostilt_common::LowerLegsOnFrameRequest :md5sum-) "62c1b1b14c2ae58036a5a019416e2f57")
(setf (get robostilt_common::LowerLegsOnFrameRequest :datatype-) "robostilt_common/LowerLegsOnFrameRequest")
(setf (get robostilt_common::LowerLegsOnFrameRequest :definition-)
      "
int32 frame
float64 position
float64 velocity
float64 effort
---
bool success
")

(setf (get robostilt_common::LowerLegsOnFrameResponse :md5sum-) "62c1b1b14c2ae58036a5a019416e2f57")
(setf (get robostilt_common::LowerLegsOnFrameResponse :datatype-) "robostilt_common/LowerLegsOnFrameResponse")
(setf (get robostilt_common::LowerLegsOnFrameResponse :definition-)
      "
int32 frame
float64 position
float64 velocity
float64 effort
---
bool success
")



(provide :robostilt_common/LowerLegsOnFrame "62c1b1b14c2ae58036a5a019416e2f57")


