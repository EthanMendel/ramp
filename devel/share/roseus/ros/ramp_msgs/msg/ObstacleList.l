;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::ObstacleList)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'ObstacleList (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::OBSTACLELIST")
  (make-package "RAMP_MSGS::OBSTACLELIST"))

(in-package "ROS")
;;//! \htmlinclude ObstacleList.msg.html


(defclass ramp_msgs::ObstacleList
  :super ros::object
  :slots (_obstacles ))

(defmethod ramp_msgs::ObstacleList
  (:init
   (&key
    ((:obstacles __obstacles) ())
    )
   (send-super :init)
   (setq _obstacles __obstacles)
   self)
  (:obstacles
   (&rest __obstacles)
   (if (keywordp (car __obstacles))
       (send* _obstacles __obstacles)
     (progn
       (if __obstacles (setq _obstacles (car __obstacles)))
       _obstacles)))
  (:serialization-length
   ()
   (+
    ;; ramp_msgs/Obstacle[] _obstacles
    (apply #'+ (send-all _obstacles :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/Obstacle[] _obstacles
     (write-long (length _obstacles) s)
     (dolist (elem _obstacles)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/Obstacle[] _obstacles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obstacles (let (r) (dotimes (i n) (push (instance ramp_msgs::Obstacle :init) r)) r))
     (dolist (elem- _obstacles)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ramp_msgs::ObstacleList :md5sum-) "947b99d348284eef3629b08cb7f8113d")
(setf (get ramp_msgs::ObstacleList :datatype-) "ramp_msgs/ObstacleList")
(setf (get ramp_msgs::ObstacleList :definition-)
      "ramp_msgs/Obstacle[] obstacles

================================================================================
MSG: ramp_msgs/Obstacle
ramp_msgs/MotionState ob_ms
geometry_msgs/Transform T_w_odom

================================================================================
MSG: ramp_msgs/MotionState
float64[] positions
float64[] velocities
float64[] accelerations
float64[] jerks

# change to duration
float64 time

================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :ramp_msgs/ObstacleList "947b99d348284eef3629b08cb7f8113d")


