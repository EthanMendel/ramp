;; Auto-generated. Do not edit!


(when (boundp 'ramp_planner_new::CubicRepresentation)
  (if (not (find-package "RAMP_PLANNER_NEW"))
    (make-package "RAMP_PLANNER_NEW"))
  (shadow 'CubicRepresentation (find-package "RAMP_PLANNER_NEW")))
(unless (find-package "RAMP_PLANNER_NEW::CUBICREPRESENTATION")
  (make-package "RAMP_PLANNER_NEW::CUBICREPRESENTATION"))

(in-package "ROS")
;;//! \htmlinclude CubicRepresentation.msg.html


(defclass ramp_planner_new::CubicRepresentation
  :super ros::object
  :slots (_order _numDOF _coefficients _time ))

(defmethod ramp_planner_new::CubicRepresentation
  (:init
   (&key
    ((:order __order) 0)
    ((:numDOF __numDOF) 0)
    ((:coefficients __coefficients) ())
    ((:time __time) 0)
    )
   (send-super :init)
   (setq _order (round __order))
   (setq _numDOF (round __numDOF))
   (setq _coefficients __coefficients)
   (setq _time (round __time))
   self)
  (:order
   (&optional __order)
   (if __order (setq _order __order)) _order)
  (:numDOF
   (&optional __numDOF)
   (if __numDOF (setq _numDOF __numDOF)) _numDOF)
  (:coefficients
   (&rest __coefficients)
   (if (keywordp (car __coefficients))
       (send* _coefficients __coefficients)
     (progn
       (if __coefficients (setq _coefficients (car __coefficients)))
       _coefficients)))
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:serialization-length
   ()
   (+
    ;; uint32 _order
    4
    ;; uint32 _numDOF
    4
    ;; ramp_planner_new/Coefficient[] _coefficients
    (apply #'+ (send-all _coefficients :serialization-length)) 4
    ;; uint32 _time
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _order
       (write-long _order s)
     ;; uint32 _numDOF
       (write-long _numDOF s)
     ;; ramp_planner_new/Coefficient[] _coefficients
     (write-long (length _coefficients) s)
     (dolist (elem _coefficients)
       (send elem :serialize s)
       )
     ;; uint32 _time
       (write-long _time s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _order
     (setq _order (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _numDOF
     (setq _numDOF (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; ramp_planner_new/Coefficient[] _coefficients
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _coefficients (let (r) (dotimes (i n) (push (instance ramp_planner_new::Coefficient :init) r)) r))
     (dolist (elem- _coefficients)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; uint32 _time
     (setq _time (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ramp_planner_new::CubicRepresentation :md5sum-) "0cd6931c932c0dea333d5e01e429443f")
(setf (get ramp_planner_new::CubicRepresentation :datatype-) "ramp_planner_new/CubicRepresentation")
(setf (get ramp_planner_new::CubicRepresentation :definition-)
      "uint32 order
uint32 numDOF
ramp_planner_new/Coefficient[] coefficients
uint32 time
================================================================================
MSG: ramp_planner_new/Coefficient
float64[] values
")



(provide :ramp_planner_new/CubicRepresentation "0cd6931c932c0dea333d5e01e429443f")


