#include "../include/rviz_handler.h"

RvizHandler::RvizHandler(const ros::NodeHandle h) : handle_(h) {
  pub_markerArray_ = handle_.advertise<visualization_msgs::MarkerArray>("visualization_marker_array", 10);
  pub_trajectory = handle_.advertise<visualization_msgs::MarkerArray>("trajectory_visualization", 10);
}

unsigned int RvizHandler::getNumSubscribers(){
  return pub_markerArray_.getNumSubscribers();
}

void RvizHandler::sendMarkerArray(const visualization_msgs::MarkerArray& ma){
  pub_markerArray_.publish(ma);
}

void RvizHandler::sendTrajectory(const visualization_msgs::MarkerArray& ma){
  pub_trajectory.publish(ma);
}