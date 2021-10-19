#include "../include/rviz_handler.h"

RvizHandler::RvizHandler(const ros::NodeHandle h) : handle_(h) {
  pub_markerArray_ = handle_.advertise<visualization_msgs::MarkerArray>("visualization_marker_array", 10);
  pub_coefs_ = handle_.advertise<ramp_planner_new::CubicRepresentation>("coef_channel", 10);
  pub_twist_ = handle_.advertise<geometry_msgs::Twist>("twistCannel",10);
}

unsigned int RvizHandler::getNumSubscribers(){
  return pub_markerArray_.getNumSubscribers() + pub_coefs_.getNumSubscribers() + pub_twist_.getNumSubscribers();
}

void RvizHandler::sendMarkerArray(const visualization_msgs::MarkerArray& ma){
  pub_markerArray_.publish(ma);
}

void RvizHandler::sendCoefs(const ramp_planner_new::CubicRepresentation& c){
  pub_coefs_.publish(c);
}

void RvizHandler::sendTwist(const geometry_msgs::Twist& t){
  pub_twist_.publish(t);
}