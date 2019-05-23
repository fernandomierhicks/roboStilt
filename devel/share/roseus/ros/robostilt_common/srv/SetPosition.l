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
  :slots (_indexes _positions _velocities _efforts ))

(defmethod robostilt_common::SetPositionRequest
  (:init
   (&key
    ((:indexes __indexes) (make-array 0 :initial-element 0 :element-type :integer))
    ((:positions __positions) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:velocities __velocities) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:efforts __efforts) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _indexes __indexes)
   (setq _positions __positions)
   (setq _velocities __velocities)
   (setq _efforts __efforts)
   self)
  (:indexes
   (&optional __indexes)
   (if __indexes (setq _indexes __indexes)) _indexes)
  (:positions
   (&optional __positions)
   (if __positions (setq _positions __positions)) _positions)
  (:velocities
   (&optional __velocities)
   (if __velocities (setq _velocities __velocities)) _velocities)
  (:efforts
   (&optional __efforts)
   (if __efforts (setq _efforts __efforts)) _efforts)
  (:serialization-length
   ()
   (+
    ;; int32[] _indexes
    (* 4    (length _indexes)) 4
    ;; float64[] _positions
    (* 8    (length _positions)) 4
    ;; float64[] _velocities
    (* 8    (length _velocities)) 4
    ;; float64[] _efforts
    (* 8    (length _efforts)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _indexes
     (write-long (length _indexes) s)
     (dotimes (i (length _indexes))
       (write-long (elt _indexes i) s)
       )
     ;; float64[] _positions
     (write-long (length _positions) s)
     (dotimes (i (length _positions))
       (sys::poke (elt _positions i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _velocities
     (write-long (length _velocities) s)
     (dotimes (i (length _velocities))
       (sys::poke (elt _velocities i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _efforts
     (write-long (length _efforts) s)
     (dotimes (i (length _efforts))
       (sys::poke (elt _efforts i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _indexes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _indexes (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _indexes i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float64[] _positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _positions (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _positions i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _velocities
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _velocities (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _velocities i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _efforts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _efforts (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _efforts i) (sys::peek buf ptr- :double)) (incf ptr- 8)
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

(setf (get robostilt_common::SetPosition :md5sum-) "7d0c2d81f2531fd032e1874cd31efec8")
(setf (get robostilt_common::SetPosition :datatype-) "robostilt_common/SetPosition")
(setf (get robostilt_common::SetPosition :request) robostilt_common::SetPositionRequest)
(setf (get robostilt_common::SetPosition :response) robostilt_common::SetPositionResponse)

(defmethod robostilt_common::SetPositionRequest
  (:response () (instance robostilt_common::SetPositionResponse :init)))

(setf (get robostilt_common::SetPositionRequest :md5sum-) "7d0c2d81f2531fd032e1874cd31efec8")
(setf (get robostilt_common::SetPositionRequest :datatype-) "robostilt_common/SetPositionRequest")
(setf (get robostilt_common::SetPositionRequest :definition-)
      "


int32[] indexes
float64[] positions
float64[] velocities
float64[] efforts
---
bool success
")

(setf (get robostilt_common::SetPositionResponse :md5sum-) "7d0c2d81f2531fd032e1874cd31efec8")
(setf (get robostilt_common::SetPositionResponse :datatype-) "robostilt_common/SetPositionResponse")
(setf (get robostilt_common::SetPositionResponse :definition-)
      "


int32[] indexes
float64[] positions
float64[] velocities
float64[] efforts
---
bool success
")



(provide :robostilt_common/SetPosition "7d0c2d81f2531fd032e1874cd31efec8")


