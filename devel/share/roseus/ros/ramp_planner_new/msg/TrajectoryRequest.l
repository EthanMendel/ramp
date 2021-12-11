;; Auto-generated. Do not edit!


(when (boundp 'ramp_planner_new::TrajectoryRequest)
  (if (not (find-package "RAMP_PLANNER_NEW"))
    (make-package "RAMP_PLANNER_NEW"))
  (shadow 'TrajectoryRequest (find-package "RAMP_PLANNER_NEW")))
(unless (find-package "RAMP_PLANNER_NEW::TRAJECTORYREQUEST")
  (make-package "RAMP_PLANNER_NEW::TRAJECTORYREQUEST"))

(in-package "ROS")
;;//! \htmlinclude TrajectoryRequest.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass ramp_planner_new::TrajectoryRequest
  :super ros::object
  :slots (_timeNeeded _timeDelta _type _points ))

(defmethod ramp_planner_new::TrajectoryRequest
  (:init
   (&key
    ((:timeNeeded __timeNeeded) 0)
    ((:timeDelta __timeDelta) 0)
    ((:type __type) "")
    ((:points __points) ())
    )
   (send-super :init)
   (setq _timeNeeded (round __timeNeeded))
   (setq _timeDelta (round __timeDelta))
   (setq _type (string __type))
   (setq _points __points)
   self)
  (:timeNeeded
   (&optional __timeNeeded)
   (if __timeNeeded (setq _timeNeeded __timeNeeded)) _timeNeeded)
  (:timeDelta
   (&optional __timeDelta)
   (if __timeDelta (setq _timeDelta __timeDelta)) _timeDelta)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:serialization-length
   ()
   (+
    ;; uint8 _timeNeeded
    1
    ;; uint8 _timeDelta
    1
    ;; string _type
    4 (length _type)
    ;; geometry_msgs/Point[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _timeNeeded
       (write-byte _timeNeeded s)
     ;; uint8 _timeDelta
       (write-byte _timeDelta s)
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; geometry_msgs/Point[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _timeNeeded
     (setq _timeNeeded (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _timeDelta
     (setq _timeDelta (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Point[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ramp_planner_new::TrajectoryRequest :md5sum-) "5807e025a182a2dd09ae68814e63e47d")
(setf (get ramp_planner_new::TrajectoryRequest :datatype-) "ramp_planner_new/TrajectoryRequest")
(setf (get ramp_planner_new::TrajectoryRequest :definition-)
      "uint8 timeNeeded
uint8 timeDelta
string type
geometry_msgs/Point[] points
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :ramp_planner_new/TrajectoryRequest "5807e025a182a2dd09ae68814e63e47d")


