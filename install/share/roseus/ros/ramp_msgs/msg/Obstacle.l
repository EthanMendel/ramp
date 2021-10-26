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
(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))


(defclass ramp_msgs::Obstacle
  :super ros::object
  :slots (_ob_ms _cirGroup _odom _T_w_odom ))

(defmethod ramp_msgs::Obstacle
  (:init
   (&key
    ((:ob_ms __ob_ms) (instance ramp_msgs::MotionState :init))
    ((:cirGroup __cirGroup) (instance ramp_msgs::CircleGroup :init))
    ((:odom __odom) (instance nav_msgs::Odometry :init))
    ((:T_w_odom __T_w_odom) (instance geometry_msgs::Transform :init))
    )
   (send-super :init)
   (setq _ob_ms __ob_ms)
   (setq _cirGroup __cirGroup)
   (setq _odom __odom)
   (setq _T_w_odom __T_w_odom)
   self)
  (:ob_ms
   (&rest __ob_ms)
   (if (keywordp (car __ob_ms))
       (send* _ob_ms __ob_ms)
     (progn
       (if __ob_ms (setq _ob_ms (car __ob_ms)))
       _ob_ms)))
  (:cirGroup
   (&rest __cirGroup)
   (if (keywordp (car __cirGroup))
       (send* _cirGroup __cirGroup)
     (progn
       (if __cirGroup (setq _cirGroup (car __cirGroup)))
       _cirGroup)))
  (:odom
   (&rest __odom)
   (if (keywordp (car __odom))
       (send* _odom __odom)
     (progn
       (if __odom (setq _odom (car __odom)))
       _odom)))
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
    ;; ramp_msgs/CircleGroup _cirGroup
    (send _cirGroup :serialization-length)
    ;; nav_msgs/Odometry _odom
    (send _odom :serialization-length)
    ;; geometry_msgs/Transform _T_w_odom
    (send _T_w_odom :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/MotionState _ob_ms
       (send _ob_ms :serialize s)
     ;; ramp_msgs/CircleGroup _cirGroup
       (send _cirGroup :serialize s)
     ;; nav_msgs/Odometry _odom
       (send _odom :serialize s)
     ;; geometry_msgs/Transform _T_w_odom
       (send _T_w_odom :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/MotionState _ob_ms
     (send _ob_ms :deserialize buf ptr-) (incf ptr- (send _ob_ms :serialization-length))
   ;; ramp_msgs/CircleGroup _cirGroup
     (send _cirGroup :deserialize buf ptr-) (incf ptr- (send _cirGroup :serialization-length))
   ;; nav_msgs/Odometry _odom
     (send _odom :deserialize buf ptr-) (incf ptr- (send _odom :serialization-length))
   ;; geometry_msgs/Transform _T_w_odom
     (send _T_w_odom :deserialize buf ptr-) (incf ptr- (send _T_w_odom :serialization-length))
   ;;
   self)
  )

(setf (get ramp_msgs::Obstacle :md5sum-) "4161a43c4114be728fdd1d8e33f7e027")
(setf (get ramp_msgs::Obstacle :datatype-) "ramp_msgs/Obstacle")
(setf (get ramp_msgs::Obstacle :definition-)
      "ramp_msgs/MotionState ob_ms
ramp_msgs/CircleGroup cirGroup
nav_msgs/Odometry odom
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
MSG: ramp_msgs/CircleGroup
ramp_msgs/Circle fitCir
ramp_msgs/Circle[] packedCirs

================================================================================
MSG: ramp_msgs/Circle
geometry_msgs/Vector3 center
float64 radius

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
MSG: nav_msgs/Odometry
# This represents an estimate of a position and velocity in free space.  
# The pose in this message should be specified in the coordinate frame given by header.frame_id.
# The twist in this message should be specified in the coordinate frame given by the child_frame_id
Header header
string child_frame_id
geometry_msgs/PoseWithCovariance pose
geometry_msgs/TwistWithCovariance twist

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/PoseWithCovariance
# This represents a pose in free space with uncertainty.

Pose pose

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
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

================================================================================
MSG: geometry_msgs/TwistWithCovariance
# This expresses velocity in free space with uncertainty.

Twist twist

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

")



(provide :ramp_msgs/Obstacle "4161a43c4114be728fdd1d8e33f7e027")


