#include "../include/knot_point.h"

KnotPoint::KnotPoint() : stopTime_(0) {}

KnotPoint::KnotPoint(const MotionState mp) : motionState_(mp), stopTime_(0) {}

KnotPoint::KnotPoint(const ramp_msgs::KnotPoint kp) {
  motionState_ = kp.motionState;
  stopTime_ = kp.stopTime;
}

KnotPoint::KnotPoint(const geometry_msgs::Point p) : motionState_(p), stopTime_(0) {}

const bool KnotPoint::equals(const KnotPoint& kp, const double& epsilon) const {
  if(!motionState_.equals(kp.motionState_, epsilon)) {
    return false;
  }
  if(stopTime_ != kp.stopTime_) {
    return false;
  }

  return true;
}


const ramp_msgs::KnotPoint KnotPoint::buildKnotPointMsg() const {
  ramp_msgs::KnotPoint result;

  result.motionState = motionState_.msg_;
  result.stopTime = stopTime_;

  return result;
}


const std::string KnotPoint::toString() const {
  std::ostringstream result;
  
  result<<"Configuration: "<<motionState_.toString();
  result<<" Stop time: "<<stopTime_<<"\n";

  return result.str(); 
}
