#ifndef RVIZ_HANDLER_H
#define RVIZ_HANDLER_H
#include "ros/ros.h"
#include <visualization_msgs/MarkerArray.h>
#include <ramp_msgs/Path.h>
#include <ramp_planner_new/CubicRepresentation.h>
#include <geometry_msgs/Twist.h>

class RvizHandler {
  public:
    RvizHandler(const ros::NodeHandle h);

    unsigned int getNumSubscribers();
    void sendMarkerArray(const visualization_msgs::MarkerArray& ma);
    void sendCoefs(const ramp_planner_new::CubicRepresentation& c);
    void sendPathPoints(const visualization_msgs::MarkerArray& ma);

  private:
    ros::NodeHandle handle_;
    ros::Publisher pub_markerArray_;
    ros::Publisher pub_coefs_;
    ros::Publisher pub_path_points_;
};

#endif
