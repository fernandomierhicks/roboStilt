;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::RaiseLegsOnFrame)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'RaiseLegsOnFrame (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::RAISELEGSONFRAME")
  (make-package "ROBOSTILT_COMMON::RAISELEGSONFRAME"))
(unless (find-package "ROBOSTILT_COMMON::RAISELEGSONFRAMEREQUEST")
  (make-package "ROBOSTILT_COMMON::RAISELEGSONFRAMEREQUEST"))
(unless (find-package "ROBOSTILT_COMMON::RAISELEGSONFRAMERESPONSE")
  (make-package "ROBOSTILT_COMMON::RAISELEGSONFRAMERESPONSE"))

(in-package "ROS")





(defclass robostilt_common::RaiseLegsOnFrameRequest
  :super ros::object
  :slots (_frame _position ))

(defmethod robostilt_common::RaiseLegsOnFrameRequest
  (:init
   (&key
    ((:frame __frame) 0)
    ((:position __position) 0.0)
    )
   (send-super :init)
   (setq _frame (round __frame))
   (setq _position (float __position))
   self)
  (:frame
   (&optional __frame)
   (if __frame (setq _frame __frame)) _frame)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; int32 _frame
    4
    ;; float64 _position
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
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _frame
     (setq _frame (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _position
     (setq _position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass robostilt_common::RaiseLegsOnFrameResponse
  :super ros::object
  :slots (_success ))

(defmethod robostilt_common::RaiseLegsOnFrameResponse
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

(defclass robostilt_common::RaiseLegsOnFrame
  :super ros::object
  :slots ())

(setf (get robostilt_common::RaiseLegsOnFrame :md5sum-) "b8d63a087f5948862a72cd21437ca0f9")
(setf (get robostilt_common::RaiseLegsOnFrame :datatype-) "robostilt_common/RaiseLegsOnFrame")
(setf (get robostilt_common::RaiseLegsOnFrame :request) robostilt_common::RaiseLegsOnFrameRequest)
(setf (get robostilt_common::RaiseLegsOnFrame :response) robostilt_common::RaiseLegsOnFrameResponse)

(defmethod robostilt_common::RaiseLegsOnFrameRequest
  (:response () (instance robostilt_common::RaiseLegsOnFrameResponse :init)))

(setf (get robostilt_common::RaiseLegsOnFrameRequest :md5sum-) "b8d63a087f5948862a72cd21437ca0f9")
(setf (get robostilt_common::RaiseLegsOnFrameRequest :datatype-) "robostilt_common/RaiseLegsOnFrameRequest")
(setf (get robostilt_common::RaiseLegsOnFrameRequest :definition-)
      "int32 frame
float64 position
---
bool success
")

(setf (get robostilt_common::RaiseLegsOnFrameResponse :md5sum-) "b8d63a087f5948862a72cd21437ca0f9")
(setf (get robostilt_common::RaiseLegsOnFrameResponse :datatype-) "robostilt_common/RaiseLegsOnFrameResponse")
(setf (get robostilt_common::RaiseLegsOnFrameResponse :definition-)
      "int32 frame
float64 position
---
bool success
")



(provide :robostilt_common/RaiseLegsOnFrame "b8d63a087f5948862a72cd21437ca0f9")


