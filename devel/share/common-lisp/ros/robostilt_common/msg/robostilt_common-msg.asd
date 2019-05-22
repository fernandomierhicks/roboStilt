
(cl:in-package :asdf)

(defsystem "robostilt_common-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ActuatorState" :depends-on ("_package_ActuatorState"))
    (:file "_package_ActuatorState" :depends-on ("_package"))
  ))