;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::Path)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'Path (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::PATH")
  (make-package "RAMP_MSGS::PATH"))

(in-package "ROS")
;;//! \htmlinclude Path.msg.html


(defclass ramp_msgs::Path
  :super ros::object
  :slots (_points ))

(defmethod ramp_msgs::Path
  (:init
   (&key
    ((:points __points) ())
    )
   (send-super :init)
   (setq _points __points)
   self)
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
    ;; ramp_msgs/KnotPoint[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/KnotPoint[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/KnotPoint[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance ramp_msgs::KnotPoint :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ramp_msgs::Path :md5sum-) "dc3e2e8ac00d3e652ac961c6ad8ca08d")
(setf (get ramp_msgs::Path :datatype-) "ramp_msgs/Path")
(setf (get ramp_msgs::Path :definition-)
      "ramp_msgs/KnotPoint[] points

================================================================================
MSG: ramp_msgs/KnotPoint
ramp_msgs/MotionState motionState
uint32 stopTime

================================================================================
MSG: ramp_msgs/MotionState
float64[] positions
float64[] velocities
float64[] accelerations
float64[] jerks

# change to duration
float64 time

")



(provide :ramp_msgs/Path "dc3e2e8ac00d3e652ac961c6ad8ca08d")


