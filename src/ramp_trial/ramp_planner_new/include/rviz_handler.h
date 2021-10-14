#ifndef RVIZ_HANDLER_H
#define RVIZ_HANDLER_H
#include "ros/ros.h"
#include <visualization_msgs/MarkerArray.h>
#include <ramp_msgs/Path.h>
#include <geometry_msgs/Twist.h>

class RvizHandler {
  public:
    RvizHandler(const ros::NodeHandle h);

    unsigned int getNumSubscribers();
    void sendMarkerArray(const visualization_msgs::MarkerArray& ma);
    void sendPath(const ramp_msgs::Path& p);
    void sendTwist(const geometry_msgs::Twist& t);

  private:
    ros::NodeHandle handle_;
    ros::Publisher pub_markerArray_;
    ros::Publisher pub_path_;
    ros::Publisher pub_twist_;
};

#endif
