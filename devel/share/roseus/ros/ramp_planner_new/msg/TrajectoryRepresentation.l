;; Auto-generated. Do not edit!


(when (boundp 'ramp_planner_new::TrajectoryRepresentation)
  (if (not (find-package "RAMP_PLANNER_NEW"))
    (make-package "RAMP_PLANNER_NEW"))
  (shadow 'TrajectoryRepresentation (find-package "RAMP_PLANNER_NEW")))
(unless (find-package "RAMP_PLANNER_NEW::TRAJECTORYREPRESENTATION")
  (make-package "RAMP_PLANNER_NEW::TRAJECTORYREPRESENTATION"))

(in-package "ROS")
;;//! \htmlinclude TrajectoryRepresentation.msg.html


(defclass ramp_planner_new::TrajectoryRepresentation
  :super ros::object
  :slots (_order _numDOF _type _coefficients _uCoefficients _resolution _active _startTime _totalTime ))

(defmethod ramp_planner_new::TrajectoryRepresentation
  (:init
   (&key
    ((:order __order) 0)
    ((:numDOF __numDOF) 0)
    ((:type __type) "")
    ((:coefficients __coefficients) ())
    ((:uCoefficients __uCoefficients) ())
    ((:resolution __resolution) 0.0)
    ((:active __active) nil)
    ((:startTime __startTime) 0.0)
    ((:totalTime __totalTime) 0.0)
    )
   (send-super :init)
   (setq _order (round __order))
   (setq _numDOF (round __numDOF))
   (setq _type (string __type))
   (setq _coefficients __coefficients)
   (setq _uCoefficients __uCoefficients)
   (setq _resolution (float __resolution))
   (setq _active __active)
   (setq _startTime (float __startTime))
   (setq _totalTime (float __totalTime))
   self)
  (:order
   (&optional __order)
   (if __order (setq _order __order)) _order)
  (:numDOF
   (&optional __numDOF)
   (if __numDOF (setq _numDOF __numDOF)) _numDOF)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:coefficients
   (&rest __coefficients)
   (if (keywordp (car __coefficients))
       (send* _coefficients __coefficients)
     (progn
       (if __coefficients (setq _coefficients (car __coefficients)))
       _coefficients)))
  (:uCoefficients
   (&rest __uCoefficients)
   (if (keywordp (car __uCoefficients))
       (send* _uCoefficients __uCoefficients)
     (progn
       (if __uCoefficients (setq _uCoefficients (car __uCoefficients)))
       _uCoefficients)))
  (:resolution
   (&optional __resolution)
   (if __resolution (setq _resolution __resolution)) _resolution)
  (:active
   (&optional (__active :null))
   (if (not (eq __active :null)) (setq _active __active)) _active)
  (:startTime
   (&optional __startTime)
   (if __startTime (setq _startTime __startTime)) _startTime)
  (:totalTime
   (&optional __totalTime)
   (if __totalTime (setq _totalTime __totalTime)) _totalTime)
  (:serialization-length
   ()
   (+
    ;; uint32 _order
    4
    ;; uint32 _numDOF
    4
    ;; string _type
    4 (length _type)
    ;; ramp_planner_new/Coefficient[] _coefficients
    (apply #'+ (send-all _coefficients :serialization-length)) 4
    ;; ramp_planner_new/Coefficient[] _uCoefficients
    (apply #'+ (send-all _uCoefficients :serialization-length)) 4
    ;; float64 _resolution
    8
    ;; bool _active
    1
    ;; float64 _startTime
    8
    ;; float64 _totalTime
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
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; ramp_planner_new/Coefficient[] _coefficients
     (write-long (length _coefficients) s)
     (dolist (elem _coefficients)
       (send elem :serialize s)
       )
     ;; ramp_planner_new/Coefficient[] _uCoefficients
     (write-long (length _uCoefficients) s)
     (dolist (elem _uCoefficients)
       (send elem :serialize s)
       )
     ;; float64 _resolution
       (sys::poke _resolution (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _active
       (if _active (write-byte -1 s) (write-byte 0 s))
     ;; float64 _startTime
       (sys::poke _startTime (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _totalTime
       (sys::poke _totalTime (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _order
     (setq _order (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _numDOF
     (setq _numDOF (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; ramp_planner_new/Coefficient[] _coefficients
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _coefficients (let (r) (dotimes (i n) (push (instance ramp_planner_new::Coefficient :init) r)) r))
     (dolist (elem- _coefficients)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; ramp_planner_new/Coefficient[] _uCoefficients
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _uCoefficients (let (r) (dotimes (i n) (push (instance ramp_planner_new::Coefficient :init) r)) r))
     (dolist (elem- _uCoefficients)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float64 _resolution
     (setq _resolution (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _active
     (setq _active (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _startTime
     (setq _startTime (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _totalTime
     (setq _totalTime (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ramp_planner_new::TrajectoryRepresentation :md5sum-) "2fb6a8686a3294d98b86c6717636ecfe")
(setf (get ramp_planner_new::TrajectoryRepresentation :datatype-) "ramp_planner_new/TrajectoryRepresentation")
(setf (get ramp_planner_new::TrajectoryRepresentation :definition-)
      "uint32 order
uint32 numDOF
string type
ramp_planner_new/Coefficient[] coefficients
ramp_planner_new/Coefficient[] uCoefficients
float64 resolution
bool active
float64 startTime
float64 totalTime
================================================================================
MSG: ramp_planner_new/Coefficient
float64[] values
")



(provide :ramp_planner_new/TrajectoryRepresentation "2fb6a8686a3294d98b86c6717636ecfe")


