;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::RampTrajectory)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'RampTrajectory (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::RAMPTRAJECTORY")
  (make-package "RAMP_MSGS::RAMPTRAJECTORY"))

(in-package "ROS")
;;//! \htmlinclude RampTrajectory.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))
(if (not (find-package "TRAJECTORY_MSGS"))
  (ros::roseus-add-msgs "trajectory_msgs"))


(defclass ramp_msgs::RampTrajectory
  :super ros::object
  :slots (_header _id _trajectory _i_knotPoints _curves _holonomic_path _feasible _fitness _t_firstCollision _i_subPopulation _t_start ))

(defmethod ramp_msgs::RampTrajectory
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:id __id) 0)
    ((:trajectory __trajectory) (instance trajectory_msgs::JointTrajectory :init))
    ((:i_knotPoints __i_knotPoints) (make-array 0 :initial-element 0 :element-type :integer))
    ((:curves __curves) ())
    ((:holonomic_path __holonomic_path) (instance ramp_msgs::Path :init))
    ((:feasible __feasible) nil)
    ((:fitness __fitness) 0.0)
    ((:t_firstCollision __t_firstCollision) (instance ros::time :init))
    ((:i_subPopulation __i_subPopulation) 0)
    ((:t_start __t_start) (instance ros::time :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _id (round __id))
   (setq _trajectory __trajectory)
   (setq _i_knotPoints __i_knotPoints)
   (setq _curves __curves)
   (setq _holonomic_path __holonomic_path)
   (setq _feasible __feasible)
   (setq _fitness (float __fitness))
   (setq _t_firstCollision __t_firstCollision)
   (setq _i_subPopulation (round __i_subPopulation))
   (setq _t_start __t_start)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:trajectory
   (&rest __trajectory)
   (if (keywordp (car __trajectory))
       (send* _trajectory __trajectory)
     (progn
       (if __trajectory (setq _trajectory (car __trajectory)))
       _trajectory)))
  (:i_knotPoints
   (&optional __i_knotPoints)
   (if __i_knotPoints (setq _i_knotPoints __i_knotPoints)) _i_knotPoints)
  (:curves
   (&rest __curves)
   (if (keywordp (car __curves))
       (send* _curves __curves)
     (progn
       (if __curves (setq _curves (car __curves)))
       _curves)))
  (:holonomic_path
   (&rest __holonomic_path)
   (if (keywordp (car __holonomic_path))
       (send* _holonomic_path __holonomic_path)
     (progn
       (if __holonomic_path (setq _holonomic_path (car __holonomic_path)))
       _holonomic_path)))
  (:feasible
   (&optional (__feasible :null))
   (if (not (eq __feasible :null)) (setq _feasible __feasible)) _feasible)
  (:fitness
   (&optional __fitness)
   (if __fitness (setq _fitness __fitness)) _fitness)
  (:t_firstCollision
   (&optional __t_firstCollision)
   (if __t_firstCollision (setq _t_firstCollision __t_firstCollision)) _t_firstCollision)
  (:i_subPopulation
   (&optional __i_subPopulation)
   (if __i_subPopulation (setq _i_subPopulation __i_subPopulation)) _i_subPopulation)
  (:t_start
   (&optional __t_start)
   (if __t_start (setq _t_start __t_start)) _t_start)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint16 _id
    2
    ;; trajectory_msgs/JointTrajectory _trajectory
    (send _trajectory :serialization-length)
    ;; uint16[] _i_knotPoints
    (* 2    (length _i_knotPoints)) 4
    ;; ramp_msgs/BezierCurve[] _curves
    (apply #'+ (send-all _curves :serialization-length)) 4
    ;; ramp_msgs/Path _holonomic_path
    (send _holonomic_path :serialization-length)
    ;; bool _feasible
    1
    ;; float64 _fitness
    8
    ;; duration _t_firstCollision
    8
    ;; int8 _i_subPopulation
    1
    ;; duration _t_start
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16 _id
       (write-word _id s)
     ;; trajectory_msgs/JointTrajectory _trajectory
       (send _trajectory :serialize s)
     ;; uint16[] _i_knotPoints
     (write-long (length _i_knotPoints) s)
     (dotimes (i (length _i_knotPoints))
       (write-word (elt _i_knotPoints i) s)
       )
     ;; ramp_msgs/BezierCurve[] _curves
     (write-long (length _curves) s)
     (dolist (elem _curves)
       (send elem :serialize s)
       )
     ;; ramp_msgs/Path _holonomic_path
       (send _holonomic_path :serialize s)
     ;; bool _feasible
       (if _feasible (write-byte -1 s) (write-byte 0 s))
     ;; float64 _fitness
       (sys::poke _fitness (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; duration _t_firstCollision
       (write-long (send _t_firstCollision :sec) s) (write-long (send _t_firstCollision :nsec) s)
     ;; int8 _i_subPopulation
       (write-byte _i_subPopulation s)
     ;; duration _t_start
       (write-long (send _t_start :sec) s) (write-long (send _t_start :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint16 _id
     (setq _id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; trajectory_msgs/JointTrajectory _trajectory
     (send _trajectory :deserialize buf ptr-) (incf ptr- (send _trajectory :serialization-length))
   ;; uint16[] _i_knotPoints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _i_knotPoints (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _i_knotPoints i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; ramp_msgs/BezierCurve[] _curves
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _curves (let (r) (dotimes (i n) (push (instance ramp_msgs::BezierCurve :init) r)) r))
     (dolist (elem- _curves)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; ramp_msgs/Path _holonomic_path
     (send _holonomic_path :deserialize buf ptr-) (incf ptr- (send _holonomic_path :serialization-length))
   ;; bool _feasible
     (setq _feasible (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _fitness
     (setq _fitness (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; duration _t_firstCollision
     (send _t_firstCollision :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _t_firstCollision :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int8 _i_subPopulation
     (setq _i_subPopulation (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _i_subPopulation 127) (setq _i_subPopulation (- _i_subPopulation 256)))
   ;; duration _t_start
     (send _t_start :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _t_start :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ramp_msgs::RampTrajectory :md5sum-) "13d45cd502292765a8d2b315f6b3795c")
(setf (get ramp_msgs::RampTrajectory :datatype-) "ramp_msgs/RampTrajectory")
(setf (get ramp_msgs::RampTrajectory :definition-)
      "Header header
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



(provide :ramp_msgs/RampTrajectory "13d45cd502292765a8d2b315f6b3795c")


