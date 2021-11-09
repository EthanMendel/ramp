;; Auto-generated. Do not edit!


(when (boundp 'ramp_planner_new::TrajectoryRequest)
  (if (not (find-package "RAMP_PLANNER_NEW"))
    (make-package "RAMP_PLANNER_NEW"))
  (shadow 'TrajectoryRequest (find-package "RAMP_PLANNER_NEW")))
(unless (find-package "RAMP_PLANNER_NEW::TRAJECTORYREQUEST")
  (make-package "RAMP_PLANNER_NEW::TRAJECTORYREQUEST"))

(in-package "ROS")
;;//! \htmlinclude TrajectoryRequest.msg.html


(defclass ramp_planner_new::TrajectoryRequest
  :super ros::object
  :slots (_timeNeeded _type ))

(defmethod ramp_planner_new::TrajectoryRequest
  (:init
   (&key
    ((:timeNeeded __timeNeeded) 0)
    ((:type __type) "")
    )
   (send-super :init)
   (setq _timeNeeded (round __timeNeeded))
   (setq _type (string __type))
   self)
  (:timeNeeded
   (&optional __timeNeeded)
   (if __timeNeeded (setq _timeNeeded __timeNeeded)) _timeNeeded)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; uint8 _timeNeeded
    1
    ;; string _type
    4 (length _type)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _timeNeeded
       (write-byte _timeNeeded s)
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _timeNeeded
     (setq _timeNeeded (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get ramp_planner_new::TrajectoryRequest :md5sum-) "3e58e2f39ce06e72daff4a24c5879f25")
(setf (get ramp_planner_new::TrajectoryRequest :datatype-) "ramp_planner_new/TrajectoryRequest")
(setf (get ramp_planner_new::TrajectoryRequest :definition-)
      "uint8 timeNeeded
string type
")



(provide :ramp_planner_new/TrajectoryRequest "3e58e2f39ce06e72daff4a24c5879f25")


