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
  :slots (_indexes _absolute _positions _velocities _efforts_limit_upper _efforts_limit_lower _effort_fault_expected ))

(defmethod robostilt_common::SetPositionRequest
  (:init
   (&key
    ((:indexes __indexes) (make-array 0 :initial-element 0 :element-type :integer))
    ((:absolute __absolute) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:positions __positions) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:velocities __velocities) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:efforts_limit_upper __efforts_limit_upper) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:efforts_limit_lower __efforts_limit_lower) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:effort_fault_expected __effort_fault_expected) (let (r) (dotimes (i 0) (push nil r)) r))
    )
   (send-super :init)
   (setq _indexes __indexes)
   (setq _absolute __absolute)
   (setq _positions __positions)
   (setq _velocities __velocities)
   (setq _efforts_limit_upper __efforts_limit_upper)
   (setq _efforts_limit_lower __efforts_limit_lower)
   (setq _effort_fault_expected __effort_fault_expected)
   self)
  (:indexes
   (&optional __indexes)
   (if __indexes (setq _indexes __indexes)) _indexes)
  (:absolute
   (&optional __absolute)
   (if __absolute (setq _absolute __absolute)) _absolute)
  (:positions
   (&optional __positions)
   (if __positions (setq _positions __positions)) _positions)
  (:velocities
   (&optional __velocities)
   (if __velocities (setq _velocities __velocities)) _velocities)
  (:efforts_limit_upper
   (&optional __efforts_limit_upper)
   (if __efforts_limit_upper (setq _efforts_limit_upper __efforts_limit_upper)) _efforts_limit_upper)
  (:efforts_limit_lower
   (&optional __efforts_limit_lower)
   (if __efforts_limit_lower (setq _efforts_limit_lower __efforts_limit_lower)) _efforts_limit_lower)
  (:effort_fault_expected
   (&optional __effort_fault_expected)
   (if __effort_fault_expected (setq _effort_fault_expected __effort_fault_expected)) _effort_fault_expected)
  (:serialization-length
   ()
   (+
    ;; int32[] _indexes
    (* 4    (length _indexes)) 4
    ;; bool[] _absolute
    (* 1    (length _absolute)) 4
    ;; float64[] _positions
    (* 8    (length _positions)) 4
    ;; float64[] _velocities
    (* 8    (length _velocities)) 4
    ;; float64[] _efforts_limit_upper
    (* 8    (length _efforts_limit_upper)) 4
    ;; float64[] _efforts_limit_lower
    (* 8    (length _efforts_limit_lower)) 4
    ;; bool[] _effort_fault_expected
    (* 1    (length _effort_fault_expected)) 4
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
     ;; bool[] _absolute
     (write-long (length _absolute) s)
     (dotimes (i (length _absolute))
       (if (elt _absolute i) (write-byte -1 s) (write-byte 0 s))
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
     ;; float64[] _efforts_limit_upper
     (write-long (length _efforts_limit_upper) s)
     (dotimes (i (length _efforts_limit_upper))
       (sys::poke (elt _efforts_limit_upper i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _efforts_limit_lower
     (write-long (length _efforts_limit_lower) s)
     (dotimes (i (length _efforts_limit_lower))
       (sys::poke (elt _efforts_limit_lower i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; bool[] _effort_fault_expected
     (write-long (length _effort_fault_expected) s)
     (dotimes (i (length _effort_fault_expected))
       (if (elt _effort_fault_expected i) (write-byte -1 s) (write-byte 0 s))
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
   ;; bool[] _absolute
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _absolute (make-list n))
     (dotimes (i n)
     (setf (elt _absolute i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
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
   ;; float64[] _efforts_limit_upper
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _efforts_limit_upper (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _efforts_limit_upper i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _efforts_limit_lower
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _efforts_limit_lower (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _efforts_limit_lower i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; bool[] _effort_fault_expected
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _effort_fault_expected (make-list n))
     (dotimes (i n)
     (setf (elt _effort_fault_expected i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
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

(setf (get robostilt_common::SetPosition :md5sum-) "331dfe0c104d55f905f2f4def3f15ac5")
(setf (get robostilt_common::SetPosition :datatype-) "robostilt_common/SetPosition")
(setf (get robostilt_common::SetPosition :request) robostilt_common::SetPositionRequest)
(setf (get robostilt_common::SetPosition :response) robostilt_common::SetPositionResponse)

(defmethod robostilt_common::SetPositionRequest
  (:response () (instance robostilt_common::SetPositionResponse :init)))

(setf (get robostilt_common::SetPositionRequest :md5sum-) "331dfe0c104d55f905f2f4def3f15ac5")
(setf (get robostilt_common::SetPositionRequest :datatype-) "robostilt_common/SetPositionRequest")
(setf (get robostilt_common::SetPositionRequest :definition-)
      "


int32[] indexes
bool[] absolute
float64[] positions
float64[] velocities
float64[] efforts_limit_upper
float64[] efforts_limit_lower
bool[] effort_fault_expected
---
bool success
")

(setf (get robostilt_common::SetPositionResponse :md5sum-) "331dfe0c104d55f905f2f4def3f15ac5")
(setf (get robostilt_common::SetPositionResponse :datatype-) "robostilt_common/SetPositionResponse")
(setf (get robostilt_common::SetPositionResponse :definition-)
      "


int32[] indexes
bool[] absolute
float64[] positions
float64[] velocities
float64[] efforts_limit_upper
float64[] efforts_limit_lower
bool[] effort_fault_expected
---
bool success
")



(provide :robostilt_common/SetPosition "331dfe0c104d55f905f2f4def3f15ac5")


