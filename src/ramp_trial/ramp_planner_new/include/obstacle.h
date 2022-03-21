#ifndef OBSTACLE_H
#define OBSTACLE_H
#include <vector>
#include "utility.h"
#include <visualization_msgs/Marker.h>

class Obstacle 
{
  public:
    Obstacle();
    Obstacle(std::vector<std::vector<float>> bounds);
    ~Obstacle();
    int numBounds_;

    visualization_msgs::Marker getMarker(std::string global_frame,int id);

    
  private:
    std::vector<std::vector<double>> bounds_;
    Utility utility_;
};

#endif
