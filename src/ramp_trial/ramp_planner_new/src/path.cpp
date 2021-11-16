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
    msg_.points.insert(msg_.points.end()-2, kp.buildKnotPointMsg());
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

const ramp_planner_new::TrajectoryRepresentation Path::buildCubicMsg() const {
  ramp_planner_new::TrajectoryRepresentation result;
  if(coefs.size() > 0){
    result.order = coefs.at(0).size() - 1;
    result.numDOF = coefs.size();
    for(unsigned int i=0;i<coefs.size();i++){
      ramp_planner_new::Coefficient c;
      for(unsigned int j=0;j<coefs.at(i).size();j++){
        c.values.push_back(coefs.at(i).at(j));
      }
      result.coefficients.push_back(c);
    }
    result.resolution=usedT_;
    result.active = true;
    result.type = type;
  }
  // std::cout<<result<<std::endl;
  return result;
}

const std::string Path::toString() const {
  std::ostringstream result;
  for(unsigned int i=0;i<msg_.points.size();i++) {
    result<<"\n  "<<i<<": "<<utility_.toString(msg_.points[i]).c_str();
  }
  return result.str();
}

void Path::findBezierCoefs(MotionState p0, MotionState p1, MotionState p2){
  order = 2;
  for(auto c : coefs){
    c.clear();
  }
  type = "bezier";
  coefs.clear();
    if(msg_.points.size() >= 2){
    for(unsigned int i = 0;i<p0.msg_.positions.size();i++){
      std::vector<double> hold;
      hold.push_back(p1.msg_.positions.at(i));
      hold.push_back(p0.msg_.positions.at(i) - p1.msg_.positions.at(i));//because of chain rule, multipley by -1 for first derivative
      hold.push_back(p2.msg_.positions.at(i) - p1.msg_.positions.at(i));
      coefs.push_back(hold);
      std::cout<<"A: "<<coefs.at(i).at(0)<<"\tB: "<<coefs.at(i).at(1)<<"\tC: "<<coefs.at(i).at(2)<<"\t\n";
    }
  }else{
    //HOW TO DO WITHOUT KNOWING SIZES
  }
}

void Path::makeBezierPath(const double T){
  const double resolution = T/10.0;
  usedT_ = resolution;
  ROS_INFO("making bezier path...");
  if(msg_.points.size() >= 3){
    MotionState p0 = msg_.points.at(0).motionState;//MAKE THESE DYNAMIC START AND GOALS
    MotionState p1 = msg_.points.at(1).motionState;
    MotionState p2 = msg_.points.at(2).motionState;
    findBezierCoefs(p0,p1,p2);

    for(float t=0;t<=1;t+=resolution){
      MotionState ms;
      for(unsigned int j=0;j<p0.msg_.positions.size();j++){
        ms.msg_.positions.push_back(coefs.at(j).at(0) + (pow(1-t,2)*(coefs.at(j).at(1))) +
                                    (pow(t,2)*(coefs.at(j).at(2))));
        
        ms.msg_.velocities.push_back((-2*(1-t)*(coefs.at(j).at(1))) + 
                                    (2*t*(coefs.at(j).at(2))));
        
        ms.msg_.accelerations.push_back((2*coefs.at(j).at(1)) + (coefs.at(j).at(2)));
        
        // ms.msg_.jerks.push_back();
      }
      // std::cout<<"point #"<<t+1<<"\t("<<ms.msg_.velocities.at(0)<<",\t"<<ms.msg_.velocities.at(1)<<",\t"<<ms.msg_.velocities.at(2)<<")\n";
      // MANUALLY CHANGED TO -2 BECAUSE OF WAYPOINT
      // MUST MAKE DYNAMIC
      KnotPoint kp(ms);
      msg_.points.push_back(kp.buildKnotPointMsg());
    }
  }
  std::cout<<"Full path has "<<msg_.points.size()<<" points\n";
}

//from ITCS 5151/8151 (Robotics) 2003, Jing Xiao Handout#3
//REQUIRES START AND GOAL NODES
void Path::findCubicCoefs(const double T){
  order = 3;
  usedT_ = T;
  type = "cubic";
  for(auto c : coefs){
    c.clear();
  }
  coefs.clear();
  if(msg_.points.size() >= 2){
    MotionState start = msg_.points.at(0).motionState;//MAKE THESE DYNAMIC START AND GOALS
    MotionState goal = msg_.points.at(1).motionState;
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
  ROS_INFO("making cubic path...");
  // double T = intT.data; //add some extra cusion here if we want to
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


  for(unsigned int t=1;t<T;t++){
    MotionState ms;
    for(unsigned int j=0;j<coefs.size();j++){
      ms.msg_.positions.push_back(coefs.at(j).at(0)*pow(t,3) + coefs.at(j).at(1)*pow(t,2) +
                                  coefs.at(j).at(2)*(t) + coefs.at(j).at(3));
      
      ms.msg_.velocities.push_back(3*coefs.at(j).at(0)*pow(t,2) + 2*coefs.at(j).at(1)*(t) + coefs.at(j).at(2));
      
      ms.msg_.accelerations.push_back(6*coefs.at(j).at(0)*(t) + 2*coefs.at(j).at(1));
      
      ms.msg_.jerks.push_back(6*coefs.at(j).at(0));
    }
    // std::cout<<"point #"<<t+1<<"\t("<<ms.msg_.positions.at(0)<<",\t"<<ms.msg_.positions.at(1)<<",\t"<<ms.msg_.positions.at(2)<<")\n";
    // MANUALLY CHANGED TO -2 BECAUSE OF WAYPOINT
    // MUST MAKE DYNAMIC
    addBeforeGoal(ms);
  }
  std::cout<<"Cubic path has "<<msg_.points.size()<<" points\n";
  // std::cout<<"msg_:\n"<<buildPathMsg()<<std::endl;
}
