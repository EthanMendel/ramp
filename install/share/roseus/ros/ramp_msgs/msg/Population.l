;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::Population)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'Population (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::POPULATION")
  (make-package "RAMP_MSGS::POPULATION"))

(in-package "ROS")
;;//! \htmlinclude Population.msg.html


(defclass ramp_msgs::Population
  :super ros::object
  :slots (_population _best_id _robot_id ))

(defmethod ramp_msgs::Population
  (:init
   (&key
    ((:population __population) ())
    ((:best_id __best_id) 0)
    ((:robot_id __robot_id) 0)
    )
   (send-super :init)
   (setq _population __population)
   (setq _best_id (round __best_id))
   (setq _robot_id (round __robot_id))
   self)
  (:population
   (&rest __population)
   (if (keywordp (car __population))
       (send* _population __population)
     (progn
       (if __population (setq _population (car __population)))
       _population)))
  (:best_id
   (&optional __best_id)
   (if __best_id (setq _best_id __best_id)) _best_id)
  (:robot_id
   (&optional __robot_id)
   (if __robot_id (setq _robot_id __robot_id)) _robot_id)
  (:serialization-length
   ()
   (+
    ;; ramp_msgs/RampTrajectory[] _population
    (apply #'+ (send-all _population :serialization-length)) 4
    ;; uint32 _best_id
    4
    ;; uint32 _robot_id
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/RampTrajectory[] _population
     (write-long (length _population) s)
     (dolist (elem _population)
       (send elem :serialize s)
       )
     ;; uint32 _best_id
       (write-long _best_id s)
     ;; uint32 _robot_id
       (write-long _robot_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/RampTrajectory[] _population
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _population (let (r) (dotimes (i n) (push (instance ramp_msgs::RampTrajectory :init) r)) r))
     (dolist (elem- _population)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; uint32 _best_id
     (setq _best_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _robot_id
     (setq _robot_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ramp_msgs::Population :md5sum-) "8c341abc608a5ae75ad01c78647a2f4d")
(setf (get ramp_msgs::Population :datatype-) "ramp_msgs/Population")
(setf (get ramp_msgs::Population :definition-)
      "ramp_msgs/RampTrajectory[] population
uint32 best_id
uint32 robot_id

================================================================================
MSG: ramp_msgs/RampTrajectory
Header header
uint16 id
trajectory_msgs/JointTrajectory trajectory
uint16[] i_knotPoints
ramp_msgs/BezierCurve[] curves
ramp_msgs/Path holonomic_path

bool feasible
float64 fitness

duration t_firstCollision
int8 i_subPopulation

duration t_start

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
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points

================================================================================
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start

================================================================================
MSG: ramp_msgs/BezierCurve
Header header

ramp_msgs/MotionState[] points
float64[] u_values

ramp_msgs/MotionState[] segmentPoints
ramp_msgs/MotionState[] controlPoints

float64 l
ramp_msgs/MotionState ms_maxVA
ramp_msgs/MotionState ms_initialVA
ramp_msgs/MotionState ms_begin
float64 u_0
float64 u_dot_0
float64 u_dot_max
float64 u_target

================================================================================
MSG: ramp_msgs/MotionState
float64[] positions
float64[] velocities
float64[] accelerations
float64[] jerks

# change to duration
float64 time

================================================================================
MSG: ramp_msgs/Path
ramp_msgs/KnotPoint[] points

================================================================================
MSG: ramp_msgs/KnotPoint
ramp_msgs/MotionState motionState
uint32 stopTime

")



(provide :ramp_msgs/Population "8c341abc608a5ae75ad01c78647a2f4d")


