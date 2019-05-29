
(cl:in-package :asdf)

(defsystem "robostilt_common-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ActuatorsState" :depends-on ("_package_ActuatorsState"))
    (:file "_package_ActuatorsState" :depends-on ("_package"))
    (:file "FramesState" :depends-on ("_package_FramesState"))
    (:file "_package_FramesState" :depends-on ("_package"))
    (:file "RobotState" :depends-on ("_package_RobotState"))
    (:file "_package_RobotState" :depends-on ("_package"))
    (:file "SingleActuator" :depends-on ("_package_SingleActuator"))
    (:file "_package_SingleActuator" :depends-on ("_package"))
  ))