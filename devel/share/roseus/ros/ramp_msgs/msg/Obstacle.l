;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::Obstacle)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'Obstacle (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::OBSTACLE")
  (make-package "RAMP_MSGS::OBSTACLE"))

(in-package "ROS")
;;//! \htmlinclude Obstacle.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass ramp_msgs::Obstacle
  :super ros::object
  :slots (_ob_ms _T_w_odom ))

(defmethod ramp_msgs::Obstacle
  (:init
   (&key
    ((:ob_ms __ob_ms) (instance ramp_msgs::MotionState :init))
    ((:T_w_odom __T_w_odom) (instance geometry_msgs::Transform :init))
    )
   (send-super :init)
   (setq _ob_ms __ob_ms)
   (setq _T_w_odom __T_w_odom)
   self)
  (:ob_ms
   (&rest __ob_ms)
   (if (keywordp (car __ob_ms))
       (send* _ob_ms __ob_ms)
     (progn
       (if __ob_ms (setq _ob_ms (car __ob_ms)))
       _ob_ms)))
  (:T_w_odom
   (&rest __T_w_odom)
   (if (keywordp (car __T_w_odom))
       (send* _T_w_odom __T_w_odom)
     (progn
       (if __T_w_odom (setq _T_w_odom (car __T_w_odom)))
       _T_w_odom)))
  (:serialization-length
   ()
   (+
    ;; ramp_msgs/MotionState _ob_ms
    (send _ob_ms :serialization-length)
    ;; geometry_msgs/Transform _T_w_odom
    (send _T_w_odom :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/MotionState _ob_ms
       (send _ob_ms :serialize s)
     ;; geometry_msgs/Transform _T_w_odom
       (send _T_w_odom :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/MotionState _ob_ms
     (send _ob_ms :deserialize buf ptr-) (incf ptr- (send _ob_ms :serialization-length))
   ;; geometry_msgs/Transform _T_w_odom
     (send _T_w_odom :deserialize buf ptr-) (incf ptr- (send _T_w_odom :serialization-length))
   ;;
   self)
  )

(setf (get ramp_msgs::Obstacle :md5sum-) "1c898b42573c16c59c5800c91c7d0b57")
(setf (get ramp_msgs::Obstacle :datatype-) "ramp_msgs/Obstacle")
(setf (get ramp_msgs::Obstacle :definition-)
      "ramp_msgs/MotionState ob_ms
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



(provide :ramp_msgs/Obstacle "1c898b42573c16c59c5800c91c7d0b57")


