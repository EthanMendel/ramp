#ifndef MOBILE_ROBOT_H
#define MOBILE_ROBOT_H

#include "ros/ros.h"
#include "nav_msgs/Odometry.h"
#include "geometry_msgs/Twist.h"
#include "geometry_msgs/Pose.h"
#include "geometry_msgs/Point.h"
#include "visualization_msgs/MarkerArray.h"
#include "tf/transform_datatypes.h"
#include "ramp_msgs/MotionState.h"
#include "ramp_msgs/RampTrajectory.h"
#include "ramp_planner_new/TrajectoryRepresentation.h"
#include "ramp_planner_new/Coefficient.h"
#include "std_msgs/Bool.h"
#include <math.h>
#include <ramp_planner_new/SwapRequest.h>

#define PI 3.14159f

class MobileRobot
{
  public:
    MobileRobot();
  ~MobileRobot();

  /** Methods **/ 
  void init(ros::NodeHandle& h);

  void moveOnTrajectory();
  void moveOnTrajectoryRot(const ramp_msgs::RampTrajectory traj, bool simulation);
  void updateTrajectory(const ramp_planner_new::TrajectoryRepresentation& msg); 
  void setNextTwist(); 
  void imminentCollisionCb(const std_msgs::Bool msg); 
  void sendTwist(const geometry_msgs::Twist twist) const;
  void controlCycle(geometry_msgs::Twist twist, ros::Time end_time, ros::Rate r);

  /** Data Members **/
  ros::Publisher                    pub_phidget_motor_;
  ros::Publisher                    pub_twist_;
  ros::Publisher                    pub_cmd_vel_;
  ros::Publisher                    pub_cmd_vel2_;
  bool readyNext_;
  ramp_planner_new::SwapRequest swap_traj_;
  ros::Subscriber                   sub_imminent_collision_;
  ramp_msgs::MotionState            motion_state_; 
  ramp_planner_new::TrajectoryRepresentation trajectory_;
  double                            initial_theta_;
  bool                              check_imminent_coll_;
  bool                              imminent_coll_;
  bool                              sim_;

  // static const members
  static const std::string  TOPIC_STR_PHIDGET_MOTOR;
  static const std::string  TOPIC_STR_ODOMETRY;
  static const std::string  TOPIC_STR_UPDATE;
  static const std::string  TOPIC_STR_TWIST;
  static const std::string  TOPIC_STR_IC;
  static const std::string  TOPIC_STR_SIM;
  static const std::string  TOPIC_STR_SIM2;
  static const int          SEND_RESELUTION = 10;
  static const int          ACCELERATION_CONSTANT = 50;
  const double              CYCLE_TIME_IN_SECONDS = 0.1;
  
  std::vector<ros::Duration> t_points_;
  ros::Time t_prev_traj_;

  private:

  /** Methods **/

  void                        sendTwist() const;
  void                        calculateSpeedsAndTime();
  const bool                  checkImminentCollision();
  void                        calculateVelocities(const std::vector<ramp_planner_new::Coefficient> coefs,const std::vector<ramp_planner_new::Coefficient> uCoefs, double t);
  const double                findDistanceBetweenAngles(const double a1, const double a2) const;
  const double                positionDistance(const std::vector<double> a, const std::vector<double> b) const;
  const double                findAngleFromAToB(const std::vector<double> a, const std::vector<double> b) const;


  /** Data Members **/

  int                       seg_step_;
  int                       time_step_;
  double                    tot_time_;
  const unsigned int        k_dof_;
  bool                      started_ = false;
  bool                      look_ahead_ = false;
  int                       swapped_ = 0;
  ros::Time                 global_start_;
  ros::Time                 cur_start_;
  ros::Time                 cur_time_;
  double                    speed_linear_;
  double                    speed_angular_;
  double                    orientation_;

  geometry_msgs::Twist      twist_;
  geometry_msgs::Twist      zero_twist_;
  std::vector<double>       prevXY_;
  double                    prevTheta_;
  ramp_msgs::MotionState    prev_motion_state_; 
  ros::Time                 prev_t_;
  ros::Duration             t_immiColl_;


};

#endif