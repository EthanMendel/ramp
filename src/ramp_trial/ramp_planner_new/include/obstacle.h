#ifndef OBSTACLE_H
#define OBSTACLE_H
#include <vector>
#include "utility.h"



class Obstacle 
{
  public:
    Obstacle();
    Obstacle(std::vector<std::vector<float>> bounds);
    ~Obstacle();
    int numBounds_;

    
  private:
    std::vector<std::vector<float>> bounds_;
    Utility utility_;
};

#endif
