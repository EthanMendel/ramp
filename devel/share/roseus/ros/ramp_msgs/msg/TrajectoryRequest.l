;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::TrajectoryRequest)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'TrajectoryRequest (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::TRAJECTORYREQUEST")
  (make-package "RAMP_MSGS::TRAJECTORYREQUEST"))

(in-package "ROS")
;;//! \htmlinclude TrajectoryRequest.msg.html


(defclass ramp_msgs::TrajectoryRequest
  :super ros::object
  :slots (_path _type _print _bezierCurves _segments ))

(defmethod ramp_msgs::TrajectoryRequest
  (:init
   (&key
    ((:path __path) (instance ramp_msgs::Path :init))
    ((:type __type) 0)
    ((:print __print) nil)
    ((:bezierCurves __bezierCurves) ())
    ((:segments __segments) 0)
    )
   (send-super :init)
   (setq _path __path)
   (setq _type (round __type))
   (setq _print __print)
   (setq _bezierCurves __bezierCurves)
   (setq _segments (round __segments))
   self)
  (:path
   (&rest __path)
   (if (keywordp (car __path))
       (send* _path __path)
     (progn
       (if __path (setq _path (car __path)))
       _path)))
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:print
   (&optional (__print :null))
   (if (not (eq __print :null)) (setq _print __print)) _print)
  (:bezierCurves
   (&rest __bezierCurves)
   (if (keywordp (car __bezierCurves))
       (send* _bezierCurves __bezierCurves)
     (progn
       (if __bezierCurves (setq _bezierCurves (car __bezierCurves)))
       _bezierCurves)))
  (:segments
   (&optional __segments)
   (if __segments (setq _segments __segments)) _segments)
  (:serialization-length
   ()
   (+
    ;; ramp_msgs/Path _path
    (send _path :serialization-length)
    ;; uint8 _type
    1
    ;; bool _print
    1
    ;; ramp_msgs/BezierCurve[] _bezierCurves
    (apply #'+ (send-all _bezierCurves :serialization-length)) 4
    ;; int8 _segments
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/Path _path
       (send _path :serialize s)
     ;; uint8 _type
       (write-byte _type s)
     ;; bool _print
       (if _print (write-byte -1 s) (write-byte 0 s))
     ;; ramp_msgs/BezierCurve[] _bezierCurves
     (write-long (length _bezierCurves) s)
     (dolist (elem _bezierCurves)
       (send elem :serialize s)
       )
     ;; int8 _segments
       (write-byte _segments s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/Path _path
     (send _path :deserialize buf ptr-) (incf ptr- (send _path :serialization-length))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _print
     (setq _print (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; ramp_msgs/BezierCurve[] _bezierCurves
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _bezierCurves (let (r) (dotimes (i n) (push (instance ramp_msgs::BezierCurve :init) r)) r))
     (dolist (elem- _bezierCurves)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int8 _segments
     (setq _segments (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _segments 127) (setq _segments (- _segments 256)))
   ;;
   self)
  )

(setf (get ramp_msgs::TrajectoryRequest :md5sum-) "90b320ee1b26415bfc5a720e57c91cb0")
(setf (get ramp_msgs::TrajectoryRequest :datatype-) "ramp_msgs/TrajectoryRequest")
(setf (get ramp_msgs::TrajectoryRequest :definition-)
      "ramp_msgs/Path path
uint8 type 
bool print
ramp_msgs/BezierCurve[] bezierCurves
int8 segments

================================================================================
MSG: ramp_msgs/Path
ramp_msgs/KnotPoint[] points

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

")



(provide :ramp_msgs/TrajectoryRequest "90b320ee1b26415bfc5a720e57c91cb0")


