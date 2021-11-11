#include "../include/rviz_handler.h"

RvizHandler::RvizHandler(const ros::NodeHandle h) : handle_(h) {
  pub_markerArray_ = handle_.advertise<visualization_msgs::MarkerArray>("visualization_marker_array", 10);
  pub_path_points_ = handle_.advertise<visualization_msgs::MarkerArray>("path_points_channel",10);
}

unsigned int RvizHandler::getNumSubscribers(){
  return pub_markerArray_.getNumSubscribers() + pub_path_points_.getNumSubscribers();
}

void RvizHandler::sendMarkerArray(const visualization_msgs::MarkerArray& ma){
  pub_markerArray_.publish(ma);
}

void RvizHandler::sendPathPoints(const visualization_msgs::MarkerArray& ma){
  pub_path_points_.publish(ma);
}