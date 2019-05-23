
(cl:in-package :asdf)

(defsystem "robostilt_common-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "LowerLegsOnFrame" :depends-on ("_package_LowerLegsOnFrame"))
    (:file "_package_LowerLegsOnFrame" :depends-on ("_package"))
    (:file "SetPosition" :depends-on ("_package_SetPosition"))
    (:file "_package_SetPosition" :depends-on ("_package"))
  ))