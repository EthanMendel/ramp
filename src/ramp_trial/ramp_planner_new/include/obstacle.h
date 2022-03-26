#ifndef OBSTACLE_H
#define OBSTACLE_H
#include <vector>
#include "utility.h"
#include <visualization_msgs/Marker.h>
#include <ramp_planner_new/Obstacle.h>
#include <geometry_msgs/Point.h>

class Obstacle 
{
  public:
    Obstacle();
    Obstacle(std::vector<std::vector<float>> bounds);
    Obstacle(ramp_planner_new::Obstacle obs);
    ~Obstacle();

    void setId(int id);
    int numBounds_;
    int id_;

    visualization_msgs::Marker getMarker(std::string global_frame,int id);
    ramp_planner_new::Obstacle getMsg();
    geometry_msgs::Point getCenter();
    double getXradius();

    
  private:
    std::vector<std::vector<double>> bounds_;
    Utility utility_;
};

#endif
