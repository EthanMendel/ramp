#ifndef RVIZ_HANDLER_H
#define RVIZ_HANDLER_H
#include "ros/ros.h"
#include <visualization_msgs/MarkerArray.h>

class RvizHandler {
  public:
    RvizHandler(const ros::NodeHandle& h);

    void sendMarkerArray(const visualization_msgs::MarkerArray& ma);
    void sendPath(const ramp_msgs::Path& p);

  private:
    ros::NodeHandle handle_;
    ros::Publisher pub_markerArray_;
    ros::Publisher pub_path_;
};

#endif
