;; Auto-generated. Do not edit!


(when (boundp 'ramp_msgs::EvaluationResponse)
  (if (not (find-package "RAMP_MSGS"))
    (make-package "RAMP_MSGS"))
  (shadow 'EvaluationResponse (find-package "RAMP_MSGS")))
(unless (find-package "RAMP_MSGS::EVALUATIONRESPONSE")
  (make-package "RAMP_MSGS::EVALUATIONRESPONSE"))

(in-package "ROS")
;;//! \htmlinclude EvaluationResponse.msg.html


(defclass ramp_msgs::EvaluationResponse
  :super ros::object
  :slots (_fitness _feasible _t_firstCollision ))

(defmethod ramp_msgs::EvaluationResponse
  (:init
   (&key
    ((:fitness __fitness) 0.0)
    ((:feasible __feasible) nil)
    ((:t_firstCollision __t_firstCollision) (instance ros::time :init))
    )
   (send-super :init)
   (setq _fitness (float __fitness))
   (setq _feasible __feasible)
   (setq _t_firstCollision __t_firstCollision)
   self)
  (:fitness
   (&optional __fitness)
   (if __fitness (setq _fitness __fitness)) _fitness)
  (:feasible
   (&optional (__feasible :null))
   (if (not (eq __feasible :null)) (setq _feasible __feasible)) _feasible)
  (:t_firstCollision
   (&optional __t_firstCollision)
   (if __t_firstCollision (setq _t_firstCollision __t_firstCollision)) _t_firstCollision)
  (:serialization-length
   ()
   (+
    ;; float64 _fitness
    8
    ;; bool _feasible
    1
    ;; duration _t_firstCollision
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _fitness
       (sys::poke _fitness (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _feasible
       (if _feasible (write-byte -1 s) (write-byte 0 s))
     ;; duration _t_firstCollision
       (write-long (send _t_firstCollision :sec) s) (write-long (send _t_firstCollision :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _fitness
     (setq _fitness (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _feasible
     (setq _feasible (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; duration _t_firstCollision
     (send _t_firstCollision :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _t_firstCollision :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ramp_msgs::EvaluationResponse :md5sum-) "f964edf11b680c3f41b2a601ea124cac")
(setf (get ramp_msgs::EvaluationResponse :datatype-) "ramp_msgs/EvaluationResponse")
(setf (get ramp_msgs::EvaluationResponse :definition-)
      "float64 fitness
bool feasible
duration t_firstCollision

")



(provide :ramp_msgs/EvaluationResponse "f964edf11b680c3f41b2a601ea124cac")


