;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::TrajectoryResponse)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'TrajectoryResponse (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::TRAJECTORYRESPONSE")
  (make-package "RAMP_MSGS::TRAJECTORYRESPONSE"))

(in-package "ROS")
;;//! \htmlinclude TrajectoryResponse.msg.html


(defclass ramp_msgs::TrajectoryResponse
  :super ros::object
  :slots (_trajectory _error ))

(defmethod ramp_msgs::TrajectoryResponse
  (:init
   (&key
    ((:trajectory __trajectory) (instance ramp_msgs::RampTrajectory :init))
    ((:error __error) nil)
    )
   (send-super :init)
   (setq _trajectory __trajectory)
   (setq _error __error)
   self)
  (:trajectory
   (&rest __trajectory)
   (if (keywordp (car __trajectory))
       (send* _trajectory __trajectory)
     (progn
       (if __trajectory (setq _trajectory (car __trajectory)))
       _trajectory)))
  (:error
   (&optional (__error :null))
   (if (not (eq __error :null)) (setq _error __error)) _error)
  (:serialization-length
   ()
   (+
    ;; ramp_msgs/RampTrajectory _trajectory
    (send _trajectory :serialization-length)
    ;; bool _error
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/RampTrajectory _trajectory
       (send _trajectory :serialize s)
     ;; bool _error
       (if _error (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/RampTrajectory _trajectory
     (send _trajectory :deserialize buf ptr-) (incf ptr- (send _trajectory :serialization-length))
   ;; bool _error
     (setq _error (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ramp_msgs::TrajectoryResponse :md5sum-) "7f0e434125bc636478341ddb1c7831e7")
(setf (get ramp_msgs::TrajectoryResponse :datatype-) "ramp_msgs/TrajectoryResponse")
(setf (get ramp_msgs::TrajectoryResponse :definition-)
      "RampTrajectory trajectory
bool error

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



(provide :ramp_msgs/TrajectoryResponse "7f0e434125bc636478341ddb1c7831e7")


