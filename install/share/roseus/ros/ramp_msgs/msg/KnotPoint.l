;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::KnotPoint)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'KnotPoint (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::KNOTPOINT")
  (make-package "RAMP_MSGS::KNOTPOINT"))

(in-package "ROS")
;;//! \htmlinclude KnotPoint.msg.html


(defclass ramp_msgs::KnotPoint
  :super ros::object
  :slots (_motionState _stopTime ))

(defmethod ramp_msgs::KnotPoint
  (:init
   (&key
    ((:motionState __motionState) (instance ramp_msgs::MotionState :init))
    ((:stopTime __stopTime) 0)
    )
   (send-super :init)
   (setq _motionState __motionState)
   (setq _stopTime (round __stopTime))
   self)
  (:motionState
   (&rest __motionState)
   (if (keywordp (car __motionState))
       (send* _motionState __motionState)
     (progn
       (if __motionState (setq _motionState (car __motionState)))
       _motionState)))
  (:stopTime
   (&optional __stopTime)
   (if __stopTime (setq _stopTime __stopTime)) _stopTime)
  (:serialization-length
   ()
   (+
    ;; ramp_msgs/MotionState _motionState
    (send _motionState :serialization-length)
    ;; uint32 _stopTime
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ramp_msgs/MotionState _motionState
       (send _motionState :serialize s)
     ;; uint32 _stopTime
       (write-long _stopTime s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ramp_msgs/MotionState _motionState
     (send _motionState :deserialize buf ptr-) (incf ptr- (send _motionState :serialization-length))
   ;; uint32 _stopTime
     (setq _stopTime (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ramp_msgs::KnotPoint :md5sum-) "003814a67ae1dae25c6ac938e801efe5")
(setf (get ramp_msgs::KnotPoint :datatype-) "ramp_msgs/KnotPoint")
(setf (get ramp_msgs::KnotPoint :definition-)
      "ramp_msgs/MotionState motionState
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



(provide :ramp_msgs/KnotPoint "003814a67ae1dae25c6ac938e801efe5")


