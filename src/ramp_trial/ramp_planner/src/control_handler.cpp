#include "control_handler.h"

ControlHandler::ControlHandler(const ros::NodeHandle& h) : handle_(h) {
  pub_bestTrajec_ = handle_.advertise<ramp_msgs::RampTrajectory>("bestTrajec", 1000);
  pub_population_ = handle_.advertise<ramp_msgs::Population>("population", 1000);
  
  pub_imminent_collision_ = handle_.advertise<std_msgs::Bool>("imminent_collision", 1000);

  pub_latestState_ = handle_.advertise<ramp_msgs::MotionState>("/updateAfterTf", 10);
  
  pub_velocity_ = handle_.advertise<geometry_msgs::Twist>("/cmd_vel", 10);

  // number of obstacles
  std::stringstream str;
  for(uint8_t i=0;i<3;i++){
    ROS_INFO("Creating publisher for ob_IC");
    str<<"/obstacle_"<<(int)i<<"/ob_imminent_collision";
    ROS_INFO("Topic: %s", str.str().c_str());
    ros::Publisher p = handle_.advertise<std_msgs::Bool>(str.str(), 1);
    pub_ob_imminent_collision_.push_back(p);

    str.str(std::string());
    str.clear();
  }
}

void ControlHandler::send(ramp_msgs::RampTrajectory bestTrajec) {
  pub_bestTrajec_.publish(bestTrajec);
}

void ControlHandler::sendPopulation(ramp_msgs::Population population) {
  pub_population_.publish(population);
}

void ControlHandler::sendIC(std_msgs::Bool value){
  pub_imminent_collision_.publish(value);
}

void ControlHandler::sendObIC(const int i, std_msgs::Bool value){
  pub_ob_imminent_collision_.at(i).publish(value);
}

void ControlHandler::sendLatestState(ramp_msgs::MotionState ms){
  pub_latestState_.publish(ms);
}

void ControlHandler::sendVelocity(geometry_msgs::Twist t) {
  pub_velocity_.publish(t);
}
