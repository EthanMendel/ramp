
(cl:in-package :asdf)

(defsystem "ramp_planner_new-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Coefficient" :depends-on ("_package_Coefficient"))
    (:file "_package_Coefficient" :depends-on ("_package"))
    (:file "CubicRepresentation" :depends-on ("_package_CubicRepresentation"))
    (:file "_package_CubicRepresentation" :depends-on ("_package"))
    (:file "TrajectoryRepresentation" :depends-on ("_package_TrajectoryRepresentation"))
    (:file "_package_TrajectoryRepresentation" :depends-on ("_package"))
    (:file "TrajectoryRequest" :depends-on ("_package_TrajectoryRequest"))
    (:file "_package_TrajectoryRequest" :depends-on ("_package"))
  ))