#ifndef UTILITY_H
#define UTILITY_H
#include <iostream>
#include <fstream>
#include <vector>
#include <queue>
#include <sstream>
#include <math.h>
#include <limits>
#include <stdlib.h>
#include <stdio.h>
#include <chrono>
#include <time.h>
#include <signal.h>
#include "range.h"
#include "ramp_msgs/RampTrajectory.h"
#include "ramp_msgs/Path.h"
#include "ramp_msgs/ObstacleList.h"
#include "ramp_msgs/HilbertMap.h"
#include "std_msgs/Bool.h"
#include "geometry_msgs/PoseWithCovarianceStamped.h"
#include "geometry_msgs/Point.h"
#include <tf/transform_datatypes.h>
#include <tf/transform_listener.h>
#include <ros/console.h>
#include <ros/package.h>
using namespace std::chrono;

/*
 * Change this class to a singleton pattern
 */

#define PI 3.14159f

enum TrajectoryType 
{
  HOLONOMIC             = 0,
  HYBRID                = 1,
  TRANSITION            = 2,
  PREDICTION            = 3
};


class Utility {
  public:
    Utility();
    Utility(const double lin,const double ang, const double acc);

    void setMovementMaxes(const double lin, const double ang, const double acc);

    std::vector<Range> standardRanges;

    double max_speed_linear_;
    double max_speed_angular_;
    double max_acceleration_;
    
    double robot_radius_ = .175;
    
    const double positionDistance(const std::vector<double> a, const std::vector<double> b) const;

    const double findAngleFromAToB(const trajectory_msgs::JointTrajectoryPoint a, const trajectory_msgs::JointTrajectoryPoint b) const;
    const double findAngleFromAToB(const geometry_msgs::Point a, const geometry_msgs::Point b) const;
    const double findAngleFromAToB(const std::vector<float> a, const std::vector<float> b) const;
    const double findAngleFromAToB(const std::vector<double> a, const std::vector<double> b) const;
    
    const double findDistanceBetweenAngles(const double a1, const double a2) const;
    
    const double displaceAngle(const double a1, double a2) const;
    
    const double getEuclideanDist(const std::vector<double> a, std::vector<double> b) const;

    const double getMinLinTime(const geometry_msgs::Point& start, const geometry_msgs::Point& goal) const;
    
    const double getMinDistFromLineToPoint(const geometry_msgs::Point A,const geometry_msgs::Point B,geometry_msgs::Point E) const;

    const geometry_msgs::Point findFirstCollision(geometry_msgs::Point p1,geometry_msgs::Point p2,geometry_msgs::Point p3, double rad) const;

    const std::string toString(const ramp_msgs::Obstacle ob) const;
    const std::string toString(const ramp_msgs::ObstacleList ob) const;
    const std::string toString(const ramp_msgs::MotionState mp) const;
    const std::string toString(const ramp_msgs::KnotPoint kp) const;
    const std::string toString(const ramp_msgs::Path path) const;
};


#endif 
