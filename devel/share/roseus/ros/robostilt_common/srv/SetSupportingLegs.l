;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::SetSupportingLegs)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'SetSupportingLegs (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::SETSUPPORTINGLEGS")
  (make-package "ROBOSTILT_COMMON::SETSUPPORTINGLEGS"))
(unless (find-package "ROBOSTILT_COMMON::SETSUPPORTINGLEGSREQUEST")
  (make-package "ROBOSTILT_COMMON::SETSUPPORTINGLEGSREQUEST"))
(unless (find-package "ROBOSTILT_COMMON::SETSUPPORTINGLEGSRESPONSE")
  (make-package "ROBOSTILT_COMMON::SETSUPPORTINGLEGSRESPONSE"))

(in-package "ROS")





(defclass robostilt_common::SetSupportingLegsRequest
  :super ros::object
  :slots (_indexes _is_supporting_weight ))

(defmethod robostilt_common::SetSupportingLegsRequest
  (:init
   (&key
    ((:indexes __indexes) (make-array 0 :initial-element 0 :element-type :integer))
    ((:is_supporting_weight __is_supporting_weight) (let (r) (dotimes (i 0) (push nil r)) r))
    )
   (send-super :init)
   (setq _indexes __indexes)
   (setq _is_supporting_weight __is_supporting_weight)
   self)
  (:indexes
   (&optional __indexes)
   (if __indexes (setq _indexes __indexes)) _indexes)
  (:is_supporting_weight
   (&optional __is_supporting_weight)
   (if __is_supporting_weight (setq _is_supporting_weight __is_supporting_weight)) _is_supporting_weight)
  (:serialization-length
   ()
   (+
    ;; int32[] _indexes
    (* 4    (length _indexes)) 4
    ;; bool[] _is_supporting_weight
    (* 1    (length _is_supporting_weight)) 4
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
     ;; bool[] _is_supporting_weight
     (write-long (length _is_supporting_weight) s)
     (dotimes (i (length _is_supporting_weight))
       (if (elt _is_supporting_weight i) (write-byte -1 s) (write-byte 0 s))
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
   ;; bool[] _is_supporting_weight
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _is_supporting_weight (make-list n))
     (dotimes (i n)
     (setf (elt _is_supporting_weight i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;;
   self)
  )

(defclass robostilt_common::SetSupportingLegsResponse
  :super ros::object
  :slots (_success ))

(defmethod robostilt_common::SetSupportingLegsResponse
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

(defclass robostilt_common::SetSupportingLegs
  :super ros::object
  :slots ())

(setf (get robostilt_common::SetSupportingLegs :md5sum-) "7f54c2f8a83517db50c6f0cbd59094f8")
(setf (get robostilt_common::SetSupportingLegs :datatype-) "robostilt_common/SetSupportingLegs")
(setf (get robostilt_common::SetSupportingLegs :request) robostilt_common::SetSupportingLegsRequest)
(setf (get robostilt_common::SetSupportingLegs :response) robostilt_common::SetSupportingLegsResponse)

(defmethod robostilt_common::SetSupportingLegsRequest
  (:response () (instance robostilt_common::SetSupportingLegsResponse :init)))

(setf (get robostilt_common::SetSupportingLegsRequest :md5sum-) "7f54c2f8a83517db50c6f0cbd59094f8")
(setf (get robostilt_common::SetSupportingLegsRequest :datatype-) "robostilt_common/SetSupportingLegsRequest")
(setf (get robostilt_common::SetSupportingLegsRequest :definition-)
      "int32[] indexes
bool[] is_supporting_weight
---
bool success
")

(setf (get robostilt_common::SetSupportingLegsResponse :md5sum-) "7f54c2f8a83517db50c6f0cbd59094f8")
(setf (get robostilt_common::SetSupportingLegsResponse :datatype-) "robostilt_common/SetSupportingLegsResponse")
(setf (get robostilt_common::SetSupportingLegsResponse :definition-)
      "int32[] indexes
bool[] is_supporting_weight
---
bool success
")



(provide :robostilt_common/SetSupportingLegs "7f54c2f8a83517db50c6f0cbd59094f8")


