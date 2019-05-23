;; Auto-generated. Do not edit!


(when (boundp 'robostilt_common::FramesState)
  (if (not (find-package "ROBOSTILT_COMMON"))
    (make-package "ROBOSTILT_COMMON"))
  (shadow 'FramesState (find-package "ROBOSTILT_COMMON")))
(unless (find-package "ROBOSTILT_COMMON::FRAMESSTATE")
  (make-package "ROBOSTILT_COMMON::FRAMESSTATE"))

(in-package "ROS")
;;//! \htmlinclude FramesState.msg.html


(intern "*NONE*" (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(shadow '*NONE* (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(defconstant robostilt_common::FramesState::*NONE* 0)
(intern "*ODD*" (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(shadow '*ODD* (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(defconstant robostilt_common::FramesState::*ODD* 1)
(intern "*EVEN*" (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(shadow '*EVEN* (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(defconstant robostilt_common::FramesState::*EVEN* 2)
(intern "*PRISMATIC*" (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(shadow '*PRISMATIC* (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(defconstant robostilt_common::FramesState::*PRISMATIC* 3)
(intern "*REVOLUTE*" (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(shadow '*REVOLUTE* (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(defconstant robostilt_common::FramesState::*REVOLUTE* 4)
(intern "*ODD_AND_EVEN*" (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(shadow '*ODD_AND_EVEN* (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(defconstant robostilt_common::FramesState::*ODD_AND_EVEN* 5)
(intern "*PRISMATIC_AND_REVOLUTE*" (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(shadow '*PRISMATIC_AND_REVOLUTE* (find-package "ROBOSTILT_COMMON::FRAMESSTATE"))
(defconstant robostilt_common::FramesState::*PRISMATIC_AND_REVOLUTE* 6)
(defclass robostilt_common::FramesState
  :super ros::object
  :slots (_supporting_frame ))

(defmethod robostilt_common::FramesState
  (:init
   (&key
    ((:supporting_frame __supporting_frame) 0)
    )
   (send-super :init)
   (setq _supporting_frame (round __supporting_frame))
   self)
  (:supporting_frame
   (&optional __supporting_frame)
   (if __supporting_frame (setq _supporting_frame __supporting_frame)) _supporting_frame)
  (:serialization-length
   ()
   (+
    ;; uint8 _supporting_frame
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _supporting_frame
       (write-byte _supporting_frame s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _supporting_frame
     (setq _supporting_frame (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robostilt_common::FramesState :md5sum-) "6960690b13db489543fcbbdcab8fcd47")
(setf (get robostilt_common::FramesState :datatype-) "robostilt_common/FramesState")
(setf (get robostilt_common::FramesState :definition-)
      "uint8 NONE=0
uint8 ODD = 1
uint8 EVEN = 2
uint8 PRISMATIC = 3
uint8 REVOLUTE = 4
uint8 ODD_AND_EVEN = 5
uint8 PRISMATIC_AND_REVOLUTE = 6

uint8 supporting_frame

")



(provide :robostilt_common/FramesState "6960690b13db489543fcbbdcab8fcd47")


