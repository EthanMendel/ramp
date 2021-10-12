#include "../include/path.h"

Path::Path() {}

Path::Path(const KnotPoint start, const KnotPoint goal) : start_(start), goal_(goal) {
  msg_.points.push_back(start.buildKnotPointMsg());
  msg_.points.push_back(goal.buildKnotPointMsg());
}

Path::Path(const MotionState start, const MotionState goal) : start_(start), goal_(goal) {
  KnotPoint kp_s(start);
  KnotPoint kp_g(goal);
  msg_.points.push_back(kp_s.buildKnotPointMsg());
  msg_.points.push_back(kp_g.buildKnotPointMsg());
}

Path::Path(const std::vector<KnotPoint> all) {
  start_ = all.at(0);
  goal_  = all.at(all.size()-1);
  for(unsigned int i=0;i<all.size();i++) {
    msg_.points.push_back(all[i].buildKnotPointMsg());
  }
}

Path::Path(const std::vector<MotionState> all) {
  for(uint8_t i=0;i<all.size();i++) {
    KnotPoint temp(all[i]);
    msg_.points.push_back(temp.buildKnotPointMsg());
  }
}

Path::Path(const ramp_msgs::Path p) {
  KnotPoint s(p.points.at(0));
  start_ = s;
  KnotPoint g(p.points.at(p.points.size()-1));
  goal_ = g;
  for(unsigned int i=0;i<p.points.size();i++) {
    KnotPoint kp(p.points.at(i));
    msg_.points.push_back(kp.buildKnotPointMsg());
  }
}

Path::~Path() {}

const bool Path::equals(const Path& p, const double& epsilon) const {  
  if(size() != p.size()) {
    return false;
  }
  for(uint8_t i=0;i<size();i++) {
    KnotPoint temp(msg_.points[i]);
    if(!temp.equals(p.msg_.points[i], epsilon)) {
      return false;
    }
  }
  return true;
}

const KnotPoint Path::at(const uint8_t i) const {
  KnotPoint result(msg_.points[i]);
  return result;
}

void Path::offsetPositions(const MotionState diff){
  for(uint8_t i=0;i<msg_.points.size()-1;i++){
    MotionState temp(msg_.points[i].motionState);
    temp.add(diff);
    msg_.points[i].motionState = temp.msg_;
  }
}

void Path::addBeforeGoal(const KnotPoint kp) {
  if(msg_.points.size() > 0) {
    msg_.points.insert(msg_.points.end()-1, kp.buildKnotPointMsg());
  }else {
    msg_.points.push_back(kp.buildKnotPointMsg());
  }
}


/** insert motion state 'ms' into the path at path_size-1 */
void Path::addBeforeGoal(const MotionState ms) {
  KnotPoint kp(ms);
  addBeforeGoal(kp);
}

void Path::changeStart(const MotionState ms) {
  KnotPoint kp(ms);
  msg_.points.insert(msg_.points.begin(), kp.buildKnotPointMsg());
  start_ = kp;
}

const unsigned int Path::size() const { return msg_.points.size(); }

const ramp_msgs::Path Path::buildPathMsg() const {
  ramp_msgs::Path result;

  //push all configurations onto the Path msg
  for(unsigned int i=0;i<msg_.points.size();i++) {

    //build the motion state msg
    ramp_msgs::KnotPoint mp = msg_.points[i];
    //push the msg onto K
    result.points.push_back(mp);
  }
  return result;
}

const std::string Path::toString() const {
  std::ostringstream result;
  for(unsigned int i=0;i<msg_.points.size();i++) {
    result<<"\n  "<<i<<": "<<utility_.toString(msg_.points[i]).c_str();
  }
  return result.str();
}

void Path::findLinearCoefs(){
  order = 1;
  coefs.clear();
  if(msg_.points.size() >= 2){
    coefs.push_back((msg_.points.at(0).motionState.positions.at(1) - msg_.points.at(msg_.points.size() - 1).motionState.positions.at(1)) / 
                    (msg_.points.at(0).motionState.positions.at(0) - msg_.points.at(msg_.points.size() - 1).motionState.positions.at(0)));
    coefs.push_back(-(coefs.at(0)*msg_.points.at(1).motionState.positions.at(0) - msg_.points.at(1).motionState.positions.at(1)));
  }else{
    coefs.push_back(0);
    coefs.push_back(0);
  }
  std::cout<<"M: "<<coefs.at(0)<<"\nB: "<<coefs.at(1)<<"\n";
}

void Path::makeStraightPath(){
  findLinearCoefs();
  if(order!=1 && coefs.size() != 2){
    return;
  }
  double x = msg_.points.at(0).motionState.positions.at(0);
  double inc = (msg_.points.at(msg_.points.size() - 1).motionState.positions.at(0) - x)/10.0;
  for(unsigned int i=0;i<11;i++){
    MotionState ms;
    ms.msg_.positions.push_back(x+(i*inc));
    ms.msg_.positions.push_back(coefs.at(0)*(x+(i*inc))+coefs.at(1));
    ms.msg_.velocities.push_back(0);
    ms.msg_.accelerations.push_back(0);
    ms.msg_.jerks.push_back(0);
    KnotPoint kp(ms);
    msg_.points.push_back(kp.buildKnotPointMsg());
  }
}

//from ITCS 5151/8151 (Robotics) 2003, Jing Xiao Handout#3
void Path::findCubicCoefs(const unsigned int T){
  order = 3;
  coefs.clear();
  if(msg_.points.size() >= 2){
    MotionState start = msg_.points.at(0).motionState;
    MotionState goal = msg_.points.at(msg_.points.size() - 1).motionState;

    coefs.push_back( (-2/pow(T,3))*(goal.msg_.positions.at(0) - start.msg_.positions.at(0)) + (1/pow(T,2))*(start.msg_.velocities.at(0)-goal.msg_.velocities.at(0)) );
    coefs.push_back( ( 3/pow(T,2))*(goal.msg_.positions.at(0) - start.msg_.positions.at(0)) - (2/T)*start.msg_.velocities.at(0) - (1/T)*goal.msg_.velocities.at(0) );
    coefs.push_back( start.msg_.velocities.at(0) );
    coefs.push_back( start.msg_.positions.at(0) );
  }else{
    coefs.push_back(0);
    coefs.push_back(0);
    coefs.push_back(0);
    coefs.push_back(0);
  }
  std::cout<<"A: "<<coefs.at(0)<<"\nB: "<<coefs.at(1)<<"\nC: "<<coefs.at(2)<<"\nD: "<<coefs.at(3)<<"\n";
}

void Path::makeCubicPath(const unsigned int T){
  findCubicCoefs(T);
  if(order!=3 && coefs.size() != 4){
    return;
  }
  double x = msg_.points.at(0).motionState.positions.at(0);
  double inc = (msg_.points.at(msg_.points.size() - 1).motionState.positions.at(0) - x)/T;
  for(unsigned int i=0;i<T+1;i++){
    double adjustedX = x+(i*inc);
    MotionState ms;
    ms.msg_.positions.push_back(adjustedX);
    ms.msg_.positions.push_back(coefs.at(0)*pow(adjustedX,3) + coefs.at(1)*pow(adjustedX,2) +
                                coefs.at(2)*(adjustedX) + coefs.at(3));
    ms.msg_.velocities.push_back(3*coefs.at(0)*pow(adjustedX,2) + 2*coefs.at(1)*(adjustedX) + coefs.at(2));
    ms.msg_.accelerations.push_back(6*coefs.at(0)*(adjustedX) + 2*coefs.at(1));
    ms.msg_.jerks.push_back(6*coefs.at(0));
    // std::cout<<"point #"<<i+1<<"\t("<<ms.msg_.positions.at(0)<<",\t"<<ms.msg_.positions.at(1)<<")\n";
    KnotPoint kp(ms);
    msg_.points.push_back(kp.buildKnotPointMsg());
  }
  std::cout<<"Cubic path has "<<msg_.points.size()<<" points\n";
}
