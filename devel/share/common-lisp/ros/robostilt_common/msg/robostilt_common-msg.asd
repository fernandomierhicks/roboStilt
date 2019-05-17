
(cl:in-package :asdf)

(defsystem "robostilt_common-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "RoboStiltStateMessage" :depends-on ("_package_RoboStiltStateMessage"))
    (:file "_package_RoboStiltStateMessage" :depends-on ("_package"))
  ))