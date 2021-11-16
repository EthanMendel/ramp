#ifndef RVIZ_HANDLER_H
#define RVIZ_HANDLER_H
#include "ros/ros.h"
#include <visualization_msgs/MarkerArray.h>
#include <ramp_msgs/Path.h>
#include <ramp_planner_new/TrajectoryRepresentation.h>
#include <geometry_msgs/Twist.h>
#include <ramp_planner_new/PathPoints.h>

class RvizHandler {
  public:
    RvizHandler(const ros::NodeHandle h);

    unsigned int getNumSubscribers();
    void sendMarkerArray(const visualization_msgs::MarkerArray& ma);
    void sendCoefs(const ramp_planner_new::TrajectoryRepresentation& c);
    void sendPathPoints(const ramp_planner_new::PathPoints& ma);

  private:
    ros::NodeHandle handle_;
    ros::Publisher pub_markerArray_;
    ros::Publisher pub_coefs_;
    ros::Publisher pub_path_points_;
};

#endif
