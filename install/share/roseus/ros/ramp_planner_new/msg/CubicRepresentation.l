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
  :slots (_order _numDOF _coefficients _resolution ))

(defmethod ramp_planner_new::CubicRepresentation
  (:init
   (&key
    ((:order __order) 0)
    ((:numDOF __numDOF) 0)
    ((:coefficients __coefficients) ())
    ((:resolution __resolution) 0.0)
    )
   (send-super :init)
   (setq _order (round __order))
   (setq _numDOF (round __numDOF))
   (setq _coefficients __coefficients)
   (setq _resolution (float __resolution))
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
  (:resolution
   (&optional __resolution)
   (if __resolution (setq _resolution __resolution)) _resolution)
  (:serialization-length
   ()
   (+
    ;; uint32 _order
    4
    ;; uint32 _numDOF
    4
    ;; ramp_planner_new/Coefficient[] _coefficients
    (apply #'+ (send-all _coefficients :serialization-length)) 4
    ;; float64 _resolution
    8
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
     ;; float64 _resolution
       (sys::poke _resolution (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; float64 _resolution
     (setq _resolution (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ramp_planner_new::CubicRepresentation :md5sum-) "7d9f47ffad2b610ef10ede454a7dfa31")
(setf (get ramp_planner_new::CubicRepresentation :datatype-) "ramp_planner_new/CubicRepresentation")
(setf (get ramp_planner_new::CubicRepresentation :definition-)
      "uint32 order
uint32 numDOF
ramp_planner_new/Coefficient[] coefficients
float64 resolution
================================================================================
MSG: ramp_planner_new/Coefficient
float64[] values
")



(provide :ramp_planner_new/CubicRepresentation "7d9f47ffad2b610ef10ede454a7dfa31")


