;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::MovePrismaticRevolute)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'MovePrismaticRevolute (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::MOVEPRISMATICREVOLUTE")
  (make-package "ROBOSTILT_COMMON::MOVEPRISMATICREVOLUTE"))
(unless (find-package "ROBOSTILT_COMMON::MOVEPRISMATICREVOLUTEREQUEST")
  (make-package "ROBOSTILT_COMMON::MOVEPRISMATICREVOLUTEREQUEST"))
(unless (find-package "ROBOSTILT_COMMON::MOVEPRISMATICREVOLUTERESPONSE")
  (make-package "ROBOSTILT_COMMON::MOVEPRISMATICREVOLUTERESPONSE"))

(in-package "ROS")





(defclass robostilt_common::MovePrismaticRevoluteRequest
  :super ros::object
  :slots (_frame _position _angle ))

(defmethod robostilt_common::MovePrismaticRevoluteRequest
  (:init
   (&key
    ((:frame __frame) 0)
    ((:position __position) 0.0)
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _frame (round __frame))
   (setq _position (float __position))
   (setq _angle (float __angle))
   self)
  (:frame
   (&optional __frame)
   (if __frame (setq _frame __frame)) _frame)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; int32 _frame
    4
    ;; float64 _position
    8
    ;; float64 _angle
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
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _frame
     (setq _frame (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _position
     (setq _position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass robostilt_common::MovePrismaticRevoluteResponse
  :super ros::object
  :slots (_success ))

(defmethod robostilt_common::MovePrismaticRevoluteResponse
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

(defclass robostilt_common::MovePrismaticRevolute
  :super ros::object
  :slots ())

(setf (get robostilt_common::MovePrismaticRevolute :md5sum-) "565c8a3a9e59566cc3f236fd9834581d")
(setf (get robostilt_common::MovePrismaticRevolute :datatype-) "robostilt_common/MovePrismaticRevolute")
(setf (get robostilt_common::MovePrismaticRevolute :request) robostilt_common::MovePrismaticRevoluteRequest)
(setf (get robostilt_common::MovePrismaticRevolute :response) robostilt_common::MovePrismaticRevoluteResponse)

(defmethod robostilt_common::MovePrismaticRevoluteRequest
  (:response () (instance robostilt_common::MovePrismaticRevoluteResponse :init)))

(setf (get robostilt_common::MovePrismaticRevoluteRequest :md5sum-) "565c8a3a9e59566cc3f236fd9834581d")
(setf (get robostilt_common::MovePrismaticRevoluteRequest :datatype-) "robostilt_common/MovePrismaticRevoluteRequest")
(setf (get robostilt_common::MovePrismaticRevoluteRequest :definition-)
      "
int32 frame
float64 position
float64 angle
---
bool success
")

(setf (get robostilt_common::MovePrismaticRevoluteResponse :md5sum-) "565c8a3a9e59566cc3f236fd9834581d")
(setf (get robostilt_common::MovePrismaticRevoluteResponse :datatype-) "robostilt_common/MovePrismaticRevoluteResponse")
(setf (get robostilt_common::MovePrismaticRevoluteResponse :definition-)
      "
int32 frame
float64 position
float64 angle
---
bool success
")



(provide :robostilt_common/MovePrismaticRevolute "565c8a3a9e59566cc3f236fd9834581d")


