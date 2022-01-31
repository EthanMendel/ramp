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
  :slots (_type _points _normVals ))

(defmethod ramp_planner_new::TrajectoryRequest
  (:init
   (&key
    ((:type __type) "")
    ((:points __points) ())
    ((:normVals __normVals) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _type (string __type))
   (setq _points __points)
   (setq _normVals __normVals)
   self)
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
  (:normVals
   (&optional __normVals)
   (if __normVals (setq _normVals __normVals)) _normVals)
  (:serialization-length
   ()
   (+
    ;; string _type
    4 (length _type)
    ;; geometry_msgs/Point[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ;; float64[] _normVals
    (* 8    (length _normVals)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; geometry_msgs/Point[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;; float64[] _normVals
     (write-long (length _normVals) s)
     (dotimes (i (length _normVals))
       (sys::poke (elt _normVals i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Point[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float64[] _normVals
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _normVals (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _normVals i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get ramp_planner_new::TrajectoryRequest :md5sum-) "5c125c00eccba1e258c36f6c4bcd110e")
(setf (get ramp_planner_new::TrajectoryRequest :datatype-) "ramp_planner_new/TrajectoryRequest")
(setf (get ramp_planner_new::TrajectoryRequest :definition-)
      "string type
geometry_msgs/Point[] points
float64[] normVals
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :ramp_planner_new/TrajectoryRequest "5c125c00eccba1e258c36f6c4bcd110e")


