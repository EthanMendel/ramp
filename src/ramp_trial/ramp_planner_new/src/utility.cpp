#include "../include/utility.h"

Utility::Utility() {
  Range range0(0, 2.5);
  Range range1(0, 10.f);
  Range range2(-PI, PI);
  standardRanges.push_back(range0);
  standardRanges.push_back(range1);
  standardRanges.push_back(range2);
}

Utility::Utility(const double lin, const double ang, const double acc){
  Range range0(0, 2.5);
  Range range1(0, 10.f);
  Range range2(-PI, PI);
  standardRanges.push_back(range0);
  standardRanges.push_back(range1);
  standardRanges.push_back(range2);

  max_speed_linear_ = lin;
  max_speed_angular_= ang;
  max_acceleration_ = acc;
}

void Utility::setMovementMaxes(const double lin, const double ang, const double acc){
  max_speed_linear_ = lin;
  max_speed_angular_= ang;
  max_acceleration_ = acc;
}

/** return euclidean distance between two position vectors */
const double Utility::positionDistance(const std::vector<double> a, const std::vector<double> b) const {
  double d_x = b.at(0) - a.at(0);
  double d_y = b.at(1) - a.at(1);
  return sqrt( pow(d_x,2) + pow(d_y,2) );
}

const double Utility::findAngleFromAToB(const trajectory_msgs::JointTrajectoryPoint a, const trajectory_msgs::JointTrajectoryPoint b) const {
  std::vector<double> c;
  std::vector<double> d;
  // c
  for(unsigned int i=0;i<a.positions.size();i++) {
    c.push_back(a.positions.at(i));
  }
  // d
  for(unsigned int i=0;i<b.positions.size();i++) {
    d.push_back(b.positions.at(i));
  }
  return findAngleFromAToB(c, d);
}

const double Utility::findAngleFromAToB(const std::vector<float> a, const std::vector<float> b) const {
  std::vector<double> d_a;
  std::vector<double> d_b;
  
  for(unsigned int i=0;i<a.size();i++) {
    d_a.push_back(a.at(i));
  }
  for(unsigned int i=0;i<b.size();i++) {
    d_b.push_back(b.at(i));
  }
  return findAngleFromAToB(d_a, d_b);
}

/** return the angle that forms a straight line from position a to position b. a and b are [x, y] vectors. */
const double Utility::findAngleFromAToB(const std::vector<double> a, const std::vector<double> b) const {
  double result;
  // ff the positions are the same, return the orientation the robot already has
  if(fabs(positionDistance(a, b)) < 0.01 && a.size() > 2){
    return a.at(2);
  }
  // find the distances in x,y directions and euclidean distance
  double d_x = b.at(0) - a.at(0);
  double d_y = b.at(1) - a.at(1);
  
  double euc_dist = sqrt( pow(d_x,2) + pow(d_y,2) );
  // if the positions are the same,
  // set the result to the starting orientation if one is provided
  // or to 0 if no starting orientation is provided
  if(euc_dist <= 0.0001) {
    result = 0;
  }
  // b in the 1st or 2nd quadrants
  else if(d_y > 0) {
    result = acos(d_x / euc_dist);
  }
  // b in the 3rd quadrant, d_y<0 & d_x<0
  else if(d_x < 0) {
    result = -PI - asin(d_y / euc_dist);
  }
  // b in the 4th quadrant, d_y<=0 & d_x>=0
  else {
    result = asin(d_y / euc_dist); 
  }
  return result;
}

/** return distance between orientations a1 and a2 in range [-PI, PI]. */
const double Utility::findDistanceBetweenAngles(const double a1, const double a2) const{
  double result;
  double difference = a2 - a1;
  // difference > pi, should be [-PI,0]
  if(difference > PI) {
    difference = fmodf(difference, PI);
    result = difference - PI;
  }
  // difference < -pi, should be [0,PI]
  else if(difference < -PI){
    result = difference + (2*PI);
  }
  // else, difference is fine
  else {
    result = difference;
  }
  return result;
}

const double Utility::displaceAngle(const double a1, double a2) const {
  a2 = fmodf(a2, 2*PI);
  if(a2 > PI) {
    a2 = fmodf(a2,PI) - PI;
  }
  return findDistanceBetweenAngles(-a1, a2);
}

/** a and b must be the same size */
const double Utility::getEuclideanDist(const std::vector<double> a, const std::vector<double> b) const {
  double result=0;
  for(unsigned int i=0;i<a.size();i++) {
    result += pow(a.at(i) - b.at(i), 2);
  }
  result = sqrt(result);
  return result;
}

//assuming straight line path from start to goal
const double Utility::getMinLinTime(const geometry_msgs::Point& start, const geometry_msgs::Point goal){
  double sx = start.x;
  double sy = start.y;
  double gx = goal.x;
  double gy = goal.y;

  double dist = getEuclideanDist({sx,sy},{gx,gy});
  // std::cout<<"\tbefore ceil time: "<<dist/max_speed_linear<<std::endl;
  return ceil(dist/max_speed_linear_);
}

const std::string Utility::toString(const ramp_msgs::MotionState mp) const {
  std::ostringstream result;
  result<<"\np: [ ";
  for(unsigned int i=0;i<mp.positions.size();i++) {
    result<<mp.positions.at(i)<<" ";
  }
  result<<"]";
  result<<"\nv: [ ";
  for(unsigned int i=0;i<mp.velocities.size();i++) {
    result<<mp.velocities.at(i)<<" ";
  }
  result<<"]";
  result<<"\na: [ ";
  for(unsigned int i=0;i<mp.accelerations.size();i++) {
    result<<mp.accelerations.at(i)<<" ";
  }
  result<<"]";
  result<<"\nj: [ ";
  for(unsigned int i=0;i<mp.jerks.size();i++) {
    result<<mp.jerks.at(i)<<" ";
  }
  result<<"]";
  result<<"\nTime from start: "<<mp.time;
  return result.str();
}

const std::string Utility::toString(const ramp_msgs::KnotPoint kp) const {
  std::ostringstream result;
  result<<"\nMotion State: "<<toString(kp.motionState);
  result<<", Stop time: "<<kp.stopTime;
  return result.str();
}

const std::string Utility::toString(const ramp_msgs::Path path) const {
  std::ostringstream result;
  result<<"\nPath: ";
  for(unsigned int i=0;i<path.points.size();i++) {
    result<<"\n "<<i<<": "<<toString(path.points.at(i));
  }
  return result.str();
}