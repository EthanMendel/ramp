#include "../include/rviz_handler.h"

RvizHandler::RvizHandler(const ros::NodeHandle& h) : handle_(h) 
{
  pub_markerArray_ = handle_.advertise<visualization_msgs::MarkerArray>("visualization_marker_array", 10);
  pub_path_ = handle_.advertise<ramp_msgs::Path>("path", 10);
}


void RvizHandler::sendMarkerArray(const visualization_msgs::MarkerArray& ma)
{
  pub_markerArray_.publish(ma);
}

void RvizHandler::sendPath(const ramp_msgs::Path& p){
  pub_path_.publish(p);
}
