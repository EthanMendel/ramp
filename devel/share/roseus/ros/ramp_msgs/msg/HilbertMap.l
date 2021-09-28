;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::HilbertMap)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'HilbertMap (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::HILBERTMAP")
  (make-package "RAMP_MSGS::HILBERTMAP"))

(in-package "ROS")
;;//! \htmlinclude HilbertMap.msg.html
(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))


(defclass ramp_msgs::HilbertMap
  :super ros::object
  :slots (_map _gamma ))

(defmethod ramp_msgs::HilbertMap
  (:init
   (&key
    ((:map __map) (instance nav_msgs::OccupancyGrid :init))
    ((:gamma __gamma) 0.0)
    )
   (send-super :init)
   (setq _map __map)
   (setq _gamma (float __gamma))
   self)
  (:map
   (&rest __map)
   (if (keywordp (car __map))
       (send* _map __map)
     (progn
       (if __map (setq _map (car __map)))
       _map)))
  (:gamma
   (&optional __gamma)
   (if __gamma (setq _gamma __gamma)) _gamma)
  (:serialization-length
   ()
   (+
    ;; nav_msgs/OccupancyGrid _map
    (send _map :serialization-length)
    ;; float64 _gamma
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; nav_msgs/OccupancyGrid _map
       (send _map :serialize s)
     ;; float64 _gamma
       (sys::poke _gamma (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; nav_msgs/OccupancyGrid _map
     (send _map :deserialize buf ptr-) (incf ptr- (send _map :serialization-length))
   ;; float64 _gamma
     (setq _gamma (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ramp_msgs::HilbertMap :md5sum-) "b6a8a2af53f4c3c36388c3b8ae08732f")
(setf (get ramp_msgs::HilbertMap :datatype-) "ramp_msgs/HilbertMap")
(setf (get ramp_msgs::HilbertMap :definition-)
      "nav_msgs/OccupancyGrid map
float64 gamma

================================================================================
MSG: nav_msgs/OccupancyGrid
# This represents a 2-D grid map, in which each cell represents the probability of
# occupancy.

Header header 

#MetaData for the map
MapMetaData info

# The map data, in row-major order, starting with (0,0).  Occupancy
# probabilities are in the range [0,100].  Unknown is -1.
int8[] data

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
MSG: nav_msgs/MapMetaData
# This hold basic information about the characterists of the OccupancyGrid

# The time at which the map was loaded
time map_load_time
# The map resolution [m/cell]
float32 resolution
# Map width [cells]
uint32 width
# Map height [cells]
uint32 height
# The origin of the map [m, m, rad].  This is the real-world pose of the
# cell (0,0) in the map.
geometry_msgs/Pose origin
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

")



(provide :ramp_msgs/HilbertMap "b6a8a2af53f4c3c36388c3b8ae08732f")


