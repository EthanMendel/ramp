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

const ramp_planner_new::CubicRepresentation Path::buildCubicMsg() const {
  ramp_planner_new::CubicRepresentation result;
  result.order = coefs.at(0).size();
  result.numDOF = coefs.size();
  for(unsigned int i=0;i<coefs.size();i++){
    ramp_planner_new::Coefficient c;
    for(unsigned int j=0;j<coefs.at(i).size();j++){
      c.values.push_back(coefs.at(i).at(j));
    }
    result.coefficients.push_back(c);
  }
  result.resolution=10;//change this somehow
  return result;
}

const std::string Path::toString() const {
  std::ostringstream result;
  for(unsigned int i=0;i<msg_.points.size();i++) {
    result<<"\n  "<<i<<": "<<utility_.toString(msg_.points[i]).c_str();
  }
  return result.str();
}

//coefs CHANGES NEED TO BE LOOKED AT
void Path::findLinearCoefs(){
  order = 1;
  for(auto c : coefs){
    c.clear();
  }
  coefs.clear();
  if(msg_.points.size() >= 2){
    std::vector<double> hold;
    hold.push_back((msg_.points.at(0).motionState.positions.at(1) - msg_.points.at(msg_.points.size() - 1).motionState.positions.at(1)) / 
                    (msg_.points.at(0).motionState.positions.at(0) - msg_.points.at(msg_.points.size() - 1).motionState.positions.at(0)));
    hold.push_back(-(hold.at(0)*msg_.points.at(1).motionState.positions.at(0) - msg_.points.at(1).motionState.positions.at(1)));
    coefs.push_back(hold);
  }else{
    coefs.at(0).push_back(0);
    coefs.at(0).push_back(0);
  }
  std::cout<<"M: "<<coefs.at(0).at(0)<<"\nB: "<<coefs.at(0).at(1)<<"\n";
}

//coefs CHANGES NEED TO BE LOOKED AT
void Path::makeStraightPath(){
  findLinearCoefs();
  if(order!=1 && coefs.at(0).size() != 2){
    return;
  }
  double x = msg_.points.at(0).motionState.positions.at(0);
  double inc = (msg_.points.at(msg_.points.size() - 1).motionState.positions.at(0) - x)/10.0;
  for(unsigned int i=0;i<11;i++){
    MotionState ms;
    ms.msg_.positions.push_back(x+(i*inc));
    ms.msg_.positions.push_back(coefs.at(0).at(0)*(x+(i*inc))+coefs.at(0).at(1));
    ms.msg_.velocities.push_back(0);
    ms.msg_.accelerations.push_back(0);
    ms.msg_.jerks.push_back(0);
    KnotPoint kp(ms);
    msg_.points.push_back(kp.buildKnotPointMsg());
  }
}

//from ITCS 5151/8151 (Robotics) 2003, Jing Xiao Handout#3
//REQUIRES START AND GOAL NODES
void Path::findCubicCoefs(const double T){
  order = 3;
  for(auto c : coefs){
    c.clear();
  }
  coefs.clear();
  if(msg_.points.size() >= 2){
    MotionState start = msg_.points.at(0).motionState;
    MotionState goal = msg_.points.at(msg_.points.size() - 1).motionState;
    std::cout<<"start: \t"<<start.toString()<<std::endl;
    std::cout<<"goal: \t"<<goal.toString()<<std::endl;
    for(unsigned int i = 0;i<start.msg_.positions.size();i++){
      std::vector<double> hold;
      hold.push_back( (-2/pow(T,3))*(goal.msg_.positions.at(i) - start.msg_.positions.at(i)) + (1/pow(T,2))*(start.msg_.velocities.at(i) + goal.msg_.velocities.at(i)) );
      hold.push_back( ( 3/pow(T,2))*(goal.msg_.positions.at(i) - start.msg_.positions.at(i)) - (2/T)*start.msg_.velocities.at(i) - (1/T)*goal.msg_.velocities.at(i) );
      hold.push_back( start.msg_.velocities.at(i) );
      hold.push_back( start.msg_.positions.at(i) );
      coefs.push_back(hold);
      std::cout<<"A: "<<coefs.at(i).at(0)<<"\tB: "<<coefs.at(i).at(1)<<"\tC: "<<coefs.at(i).at(2)<<"\tD: "<<coefs.at(i).at(3)<<"\t\n";
    }
  }else{
    //HOW TO DO WITHOUT KNOWING SIZES
  }
}

void Path::makeCubicPath(const double T){
  findCubicCoefs(T);
  if(order!=3 && coefs.size() != 4){
    return;
  }
  double x = msg_.points.at(0).motionState.positions.at(0);
  double y = msg_.points.at(0).motionState.positions.at(1);
  double z = msg_.points.at(0).motionState.positions.at(2);
  std::vector<double> starts = {x,y,z};
  double xInc = (msg_.points.at(msg_.points.size() - 1).motionState.positions.at(0) - x)/T;
  double yInc = (msg_.points.at(msg_.points.size() - 1).motionState.positions.at(1) - x)/T;
  double zInc = (msg_.points.at(msg_.points.size() - 1).motionState.positions.at(2) - x)/T;
  std::vector<double> incs = {xInc,yInc,zInc};


  for(unsigned int t=0;t<T+1;t++){
    MotionState ms;
    for(unsigned int j=0;j<coefs.size();j++){
      ms.msg_.positions.push_back(coefs.at(j).at(0)*pow(t,3) + coefs.at(j).at(1)*pow(t,2) +
                                  coefs.at(j).at(2)*(t) + coefs.at(j).at(3));
      
      ms.msg_.velocities.push_back(3*coefs.at(j).at(0)*pow(t,2) + 2*coefs.at(j).at(1)*(t) + coefs.at(j).at(2));
      
      ms.msg_.accelerations.push_back(6*coefs.at(j).at(0)*(t) + 2*coefs.at(j).at(1));
      
      ms.msg_.jerks.push_back(6*coefs.at(j).at(0));
    }
    // std::cout<<"point #"<<t+1<<"\t("<<ms.msg_.positions.at(0)<<",\t"<<ms.msg_.positions.at(1)<<",\t"<<ms.msg_.positions.at(2)<<")\n";
    addBeforeGoal(ms);
  }
  std::cout<<"Cubic path has "<<msg_.points.size()<<" points\n";
}
