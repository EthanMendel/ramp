#include "obstacle.h"

Obstacle::Obstacle(std::vector<std::vector<float>> bounds) {
    for(unsigned int i=0;i<bounds.size();i++){
        bounds_.push_back(bounds.at(i));
    }
    numBounds_ = bounds_.size();
}

Obstacle::~Obstacle() {}