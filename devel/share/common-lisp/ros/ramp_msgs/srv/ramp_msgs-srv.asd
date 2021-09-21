
(cl:in-package :asdf)

(defsystem "ramp_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :ramp_msgs-msg
)
  :components ((:file "_package")
    (:file "EvaluationSrv" :depends-on ("_package_EvaluationSrv"))
    (:file "_package_EvaluationSrv" :depends-on ("_package"))
    (:file "ModificationRequest" :depends-on ("_package_ModificationRequest"))
    (:file "_package_ModificationRequest" :depends-on ("_package"))
    (:file "TrajectorySrv" :depends-on ("_package_TrajectorySrv"))
    (:file "_package_TrajectorySrv" :depends-on ("_package"))
  ))