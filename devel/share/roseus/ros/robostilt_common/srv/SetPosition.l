;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::SetPosition)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'SetPosition (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::SETPOSITION")
  (make-package "ROBOSTILT_COMMON::SETPOSITION"))
(unless (find-package "ROBOSTILT_COMMON::SETPOSITIONREQUEST")
  (make-package "ROBOSTILT_COMMON::SETPOSITIONREQUEST"))
(unless (find-package "ROBOSTILT_COMMON::SETPOSITIONRESPONSE")
  (make-package "ROBOSTILT_COMMON::SETPOSITIONRESPONSE"))

(in-package "ROS")





(defclass robostilt_common::SetPositionRequest
  :super ros::object
  :slots (_index _position _velocity _effort ))

(defmethod robostilt_common::SetPositionRequest
  (:init
   (&key
    ((:index __index) (make-array 0 :initial-element 0 :element-type :integer))
    ((:position __position) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:velocity __velocity) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:effort __effort) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _index __index)
   (setq _position __position)
   (setq _velocity __velocity)
   (setq _effort __effort)
   self)
  (:index
   (&optional __index)
   (if __index (setq _index __index)) _index)
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
    ;; int32[] _index
    (* 4    (length _index)) 4
    ;; float64[] _position
    (* 8    (length _position)) 4
    ;; float64[] _velocity
    (* 8    (length _velocity)) 4
    ;; float64[] _effort
    (* 8    (length _effort)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _index
     (write-long (length _index) s)
     (dotimes (i (length _index))
       (write-long (elt _index i) s)
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
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _index
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _index (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _index i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
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
   ;;
   self)
  )

(defclass robostilt_common::SetPositionResponse
  :super ros::object
  :slots (_success ))

(defmethod robostilt_common::SetPositionResponse
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

(defclass robostilt_common::SetPosition
  :super ros::object
  :slots ())

(setf (get robostilt_common::SetPosition :md5sum-) "25c57e8d42c2eb104d5f653217a33687")
(setf (get robostilt_common::SetPosition :datatype-) "robostilt_common/SetPosition")
(setf (get robostilt_common::SetPosition :request) robostilt_common::SetPositionRequest)
(setf (get robostilt_common::SetPosition :response) robostilt_common::SetPositionResponse)

(defmethod robostilt_common::SetPositionRequest
  (:response () (instance robostilt_common::SetPositionResponse :init)))

(setf (get robostilt_common::SetPositionRequest :md5sum-) "25c57e8d42c2eb104d5f653217a33687")
(setf (get robostilt_common::SetPositionRequest :datatype-) "robostilt_common/SetPositionRequest")
(setf (get robostilt_common::SetPositionRequest :definition-)
      "


int32[] index
float64[] position
float64[] velocity
float64[] effort
---
bool success
")

(setf (get robostilt_common::SetPositionResponse :md5sum-) "25c57e8d42c2eb104d5f653217a33687")
(setf (get robostilt_common::SetPositionResponse :datatype-) "robostilt_common/SetPositionResponse")
(setf (get robostilt_common::SetPositionResponse :definition-)
      "


int32[] index
float64[] position
float64[] velocity
float64[] effort
---
bool success
")



(provide :robostilt_common/SetPosition "25c57e8d42c2eb104d5f653217a33687")


