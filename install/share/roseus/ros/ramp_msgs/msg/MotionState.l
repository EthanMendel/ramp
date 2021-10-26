;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::MotionState)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'MotionState (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::MOTIONSTATE")
  (make-package "RAMP_MSGS::MOTIONSTATE"))

(in-package "ROS")
;;//! \htmlinclude MotionState.msg.html


(defclass ramp_msgs::MotionState
  :super ros::object
  :slots (_positions _velocities _accelerations _jerks _time ))

(defmethod ramp_msgs::MotionState
  (:init
   (&key
    ((:positions __positions) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:velocities __velocities) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:accelerations __accelerations) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:jerks __jerks) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:time __time) 0.0)
    )
   (send-super :init)
   (setq _positions __positions)
   (setq _velocities __velocities)
   (setq _accelerations __accelerations)
   (setq _jerks __jerks)
   (setq _time (float __time))
   self)
  (:positions
   (&optional __positions)
   (if __positions (setq _positions __positions)) _positions)
  (:velocities
   (&optional __velocities)
   (if __velocities (setq _velocities __velocities)) _velocities)
  (:accelerations
   (&optional __accelerations)
   (if __accelerations (setq _accelerations __accelerations)) _accelerations)
  (:jerks
   (&optional __jerks)
   (if __jerks (setq _jerks __jerks)) _jerks)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:serialization-length
   ()
   (+
    ;; float64[] _positions
    (* 8    (length _positions)) 4
    ;; float64[] _velocities
    (* 8    (length _velocities)) 4
    ;; float64[] _accelerations
    (* 8    (length _accelerations)) 4
    ;; float64[] _jerks
    (* 8    (length _jerks)) 4
    ;; float64 _time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _positions
     (write-long (length _positions) s)
     (dotimes (i (length _positions))
       (sys::poke (elt _positions i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _velocities
     (write-long (length _velocities) s)
     (dotimes (i (length _velocities))
       (sys::poke (elt _velocities i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _accelerations
     (write-long (length _accelerations) s)
     (dotimes (i (length _accelerations))
       (sys::poke (elt _accelerations i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _jerks
     (write-long (length _jerks) s)
     (dotimes (i (length _jerks))
       (sys::poke (elt _jerks i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _time
       (sys::poke _time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _positions (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _positions i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _velocities
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _velocities (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _velocities i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _accelerations
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _accelerations (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _accelerations i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _jerks
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _jerks (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _jerks i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64 _time
     (setq _time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ramp_msgs::MotionState :md5sum-) "218f5989b27ffa551c78e9f622599701")
(setf (get ramp_msgs::MotionState :datatype-) "ramp_msgs/MotionState")
(setf (get ramp_msgs::MotionState :definition-)
      "float64[] positions
float64[] velocities
float64[] accelerations
float64[] jerks

# change to duration
float64 time

")



(provide :ramp_msgs/MotionState "218f5989b27ffa551c78e9f622599701")


