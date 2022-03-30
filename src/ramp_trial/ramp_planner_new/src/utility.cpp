#include "../include/utility.h"

Utility::Utility() {
  Range range0(0, 2.5);
  Range range1(0, 10.f);
  Range range2(-PI, PI);
  standardRanges.push_back(range0);
  standardRanges.push_back(range1);
  standardRanges.push_back(range2);

  max_speed_linear_ = 0.33;
  max_speed_angular_= 1.5708;
  max_acceleration_ = 0.33;
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

const double Utility::findAngleFromAToB(const geometry_msgs::Point a, const geometry_msgs::Point b) const {
  std::vector<double> c;
  std::vector<double> d;
  // c
  c.push_back(a.x);
  c.push_back(a.y);
  // d
  d.push_back(b.x);
  d.push_back(b.y);
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
const double Utility::getMinLinTime(const geometry_msgs::Point& start, const geometry_msgs::Point& goal) const{
  double sx = start.x;
  double sy = start.y;
  double gx = goal.x;
  double gy = goal.y;

  double dist = getEuclideanDist({sx,sy},{gx,gy});
  double val = dist/max_speed_linear_;
  double retVal = floor(val*10+0.5)/10;
  // std::cout<<"\ttime: "<<retVal<<std::endl;
  return retVal;
}

//code addapted from https://www.geeksforgeeks.org/minimum-distance-from-a-point-to-the-line-segment-using-vectors/
const double Utility::getMinDistFromLineToPoint(const geometry_msgs::Point p1,const geometry_msgs::Point p2, geometry_msgs::Point p3) const{
  geometry_msgs::Point AB;  // vector AB
  AB.x = p2.x - p1.x;
  AB.y = p2.y - p1.y;
  geometry_msgs::Point BE;  // vector BP
  BE.x = p3.x - p2.x;
  BE.y = p3.y - p2.y;
  geometry_msgs::Point AE;
  AE.x = p3.x - p1.x,
  AE.y = p3.y - p1.y;

  double AB_BE, AB_AE;  // Calculating the dot product
  AB_BE = (AB.x * BE.x + AB.y * BE.y);
  AB_AE = (AB.x * AE.x + AB.y * AE.y);

  double reqAns = 0;
  if (AB_BE > 0) {  // Case 1
      double y = p3.x - p2.x;      // Finding the magnitude
      double x = p3.y - p2.y;
      reqAns = sqrt(x * x + y * y);
  } else if (AB_AE < 0) {  // Case 2
      double y = p3.x - p1.x;      // Finding the magnitude
      double x = p3.y - p1.y;
      reqAns = sqrt(x * x + y * y);
  } else {  // Case 3
      double x1 = AB.x;      // Finding the perpendicular distance
      double y1 = AB.y;
      double x2 = AE.x;
      double y2 = AE.y;
      double mod = sqrt(x1 * x1 + y1 * y1);
      reqAns = abs(x1 * y2 - y1 * x2) / mod;
  }
  return reqAns;
}

const geometry_msgs::Point Utility::findFirstCollision(geometry_msgs::Point p1,geometry_msgs::Point p2,geometry_msgs::Point p3, double rad) const {
  // std::cout<<"\t\t\tchecking ("<<p1.x<<","<<p1.y<<") to \t("<<p2.x<<","<<p2.y<<")"<<std::endl;
  double d1 = positionDistance({p1.x,p1.y},{p3.x,p3.y});
  double d2 = positionDistance({p2.x,p2.y},{p3.x,p3.y});
  if(d1 <= rad + robot_radius_){//if in collision at starting point of line
    return p1;//return point 1 as first collision
  } else {
    geometry_msgs::Point midpoint;//find midpoint of line
    midpoint.x = (p1.x + p2.x)/2;
    midpoint.y = (p1.y + p2.y)/2;
    // std::cout<<"\t\tmidpoint ("<<midpoint.x<<","<<midpoint.y<<")"<<std::endl;
    // double d3 = positionDistance({midpoint.x,midpoint.y},{p3.x,p3.y});
    if(d2 > d1){//if in collision at midpoint
      return findFirstCollision(p1,midpoint,p3,rad);//repeat process for line from starting point to midpoint
    }else{
      return findFirstCollision(midpoint,p2,p3,rad);//repeat process for line from midpoint to ending point
    }
  }
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