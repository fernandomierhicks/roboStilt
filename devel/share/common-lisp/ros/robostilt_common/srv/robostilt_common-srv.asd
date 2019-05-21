
(cl:in-package :asdf)

(defsystem "robostilt_common-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "empty_call_bool_result" :depends-on ("_package_empty_call_bool_result"))
    (:file "_package_empty_call_bool_result" :depends-on ("_package"))
  ))