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

void Path::setUsedT(const double T){
  usedT_ = T;
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

void Path::addBefore(const KnotPoint kp, const KnotPoint b){
  for(unsigned int i=0;i<msg_.points.size();i++){
    if(b.equals(msg_.points.at(i))){
      // std::cout<<"found matching kp"<<std::endl;
      msg_.points.insert(msg_.points.begin() + i,kp.buildKnotPointMsg());
      return;
    }
  }
  std::cout<<"&&found no matching kp&&"<<std::endl;
  std::cout<<b.motionState_.toString()<<std::endl;
  std::cout<<"--"<<std::endl;
  std::cout<<msg_.points.at(1).motionState<<std::endl;
}

/** insert motion state 'ms' into the path before the specified element */
void Path::addBefore(const MotionState ms, const MotionState bms) {
  KnotPoint kp(ms);
  KnotPoint b(bms);
  addBefore(kp,b);
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

void Path::findBezierCoefs(geometry_msgs::Point p0, geometry_msgs::Point p1, geometry_msgs::Point p2){
  order = 2;
  for(auto c : coefs){
    c.clear();
  }
  for(auto c: uCoefs){
    c.clear();
  }
  type = "bezier";
  coefs.clear();
  uCoefs.clear();
  MotionState m0 = p0;
  MotionState m1 = p1;
  MotionState m2 = p2;
  if(msg_.points.size() > 2){
    for(unsigned int i = 0;i<m0.msg_.positions.size()-1;i++){
      std::vector<double> hold;
      hold.push_back( m0.msg_.positions.at(i) );
      hold.push_back( 2 * m1.msg_.positions.at(i) );
      hold.push_back( m2.msg_.positions.at(i) );
      coefs.push_back(hold);
      std::cout<<"A: "<<coefs.at(i).at(0)<<"\tB: "<<coefs.at(i).at(1)<<"\tC: "<<coefs.at(i).at(2)<<"\t\n";
    }
    ramp_planner_new::TrajectoryRequest uMsg;
    uMsg.timeNeeded = usedT_;
    uMsg.type = "uCubic";
    uMsg.points.push_back(p0);
    uMsg.points.push_back(p2);
    findCubicCoefs(uMsg);
    if(uCoefs.size() < 3){
      std::cout<<"u coefs is not large enough "<<uCoefs.size()<<std::endl;
      return;
    }else{
      //TODO do something for z as theta?
    }
  }else{
    //HOW TO DO WITHOUT KNOWING SIZES
  }
}

void Path::makeBezierPath(const ramp_planner_new::TrajectoryRequest msg){
  const double resolution = 1/10.0;
  usedT_ = msg.timeNeeded;
  if(msg.points.size() >= 3){
    findBezierCoefs(msg.points.at(0),msg.points.at(1),msg.points.at(2));
    //use these to bound u on the interval [0,1]
    float xuMin = uCoefs.at(0).at(0)*pow(0,3) + uCoefs.at(0).at(1)*pow(0,2) + uCoefs.at(0).at(2)*(0) + uCoefs.at(0).at(3);
    float xuMax = (uCoefs.at(0).at(0)*pow(msg.timeNeeded,3) + uCoefs.at(0).at(1)*pow(msg.timeNeeded,2) + uCoefs.at(0).at(2)*(msg.timeNeeded) + uCoefs.at(0).at(3)) - xuMin;
    float yuMin = uCoefs.at(1).at(0)*pow(0,3) + uCoefs.at(1).at(1)*pow(0,2) + uCoefs.at(1).at(2)*(0) + uCoefs.at(1).at(3);
    float yuMax = (uCoefs.at(1).at(0)*pow(msg.timeNeeded,3) + uCoefs.at(1).at(1)*pow(msg.timeNeeded,2) + uCoefs.at(1).at(2)*(msg.timeNeeded) + uCoefs.at(1).at(3)) - yuMin;
    std::vector<std::vector<float>> uAdjs = {{xuMin,xuMax},{yuMin,yuMax}};
    for(float t=0;t<=msg.timeNeeded;t+=resolution){
      MotionState ms;
      for(unsigned int j=0;j<2;j++){//run for x and y, but not z (representing theta)
        float u   = ((uCoefs.at(j).at(0)*pow(t,3) + uCoefs.at(j).at(1)*pow(t,2) + uCoefs.at(j).at(2)*(t) + uCoefs.at(j).at(3)) - uAdjs.at(j).at(0))/uAdjs.at(j).at(1);
        //TODO do uP and uPP need to be bounded on any interval?..
        float uP  = 3*uCoefs.at(j).at(0)*pow(t,2) + 2*uCoefs.at(j).at(1)*(t) + uCoefs.at(j).at(2);
        float uPP = 6*uCoefs.at(j).at(0)*(t) + 2*uCoefs.at(j).at(1);
        
        double A1 = 2*(coefs.at(j).at(0) - coefs.at(j).at(1) + coefs.at(j).at(2));
        double A2 = 2*((coefs.at(j).at(1)/2)-coefs.at(j).at(0));
        
        ms.msg_.positions.push_back( pow(1-u,2)*coefs.at(j).at(0) + u*(1-u)*coefs.at(j).at(1) + pow(u,2)*coefs.at(j).at(2) );
        
        ms.msg_.velocities.push_back( (A1*u + A2)*uP );
        
        ms.msg_.accelerations.push_back( (A1*u + A2)*uPP + A1*pow(uP,2) );
        
        // ms.msg_.jerks.push_back();
      }
      //TODO do something for z as theta?
      
      // std::cout<<"point #"<<t+1<<"\t("<<ms.msg_.velocities.at(0)<<",\t"<<ms.msg_.velocities.at(1)<<",\t"<<ms.msg_.velocities.at(2)<<")\n";
      addBefore(ms,msg.points.at(2));
    }
  }
  std::cout<<"Bezier path has "<<msg_.points.size()<<" points\n";
}

//from ITCS 5151/8151 (Robotics) 2003, Jing Xiao Handout#3
void Path::findCubicCoefs(const ramp_planner_new::TrajectoryRequest msg){
  order = 3;
  double T = msg.timeNeeded;
  usedT_ = T;
  type = msg.type;
  if(type == "cubic"){
    for(auto c : coefs){
      c.clear();
    }
      coefs.clear();
  }else{
    for(auto c : uCoefs){
      c.clear();
    }
    uCoefs.clear();
  }
  if(msg.points.size() >= 2){
    MotionState start = msg.points.at(0);
    MotionState goal = msg.points.at(1);
    for(unsigned int i = 0;i<start.msg_.positions.size();i++){
      std::vector<double> hold;
      if(i < start.msg_.positions.size()-1){//x and y
        hold.push_back( (-2/pow(T,3))*(goal.msg_.positions.at(i) - start.msg_.positions.at(i)) + (1/pow(T,2))*(start.msg_.velocities.at(i) + goal.msg_.velocities.at(i)) );
        hold.push_back( ( 3/pow(T,2))*(goal.msg_.positions.at(i) - start.msg_.positions.at(i)) - (2/T)*start.msg_.velocities.at(i) - (1/T)*goal.msg_.velocities.at(i) );
        hold.push_back( start.msg_.velocities.at(i) );
        hold.push_back( start.msg_.positions.at(i) );
      }else{//theta (z)
        hold.push_back(0);
        hold.push_back(0);
        hold.push_back(0);
        hold.push_back(0);
      }
      if(type == "cubic"){
          coefs.push_back(hold);
          std::cout<<"A: "<<coefs.at(i).at(0)<<"\tB: "<<coefs.at(i).at(1)<<"\tC: "<<coefs.at(i).at(2)<<"\tD: "<<coefs.at(i).at(3)<<"\t\n";
      }else{
          uCoefs.push_back(hold);
          std::cout<<"A: "<<uCoefs.at(i).at(0)<<"\tB: "<<uCoefs.at(i).at(1)<<"\tC: "<<uCoefs.at(i).at(2)<<"\tD: "<<uCoefs.at(i).at(3)<<"\t\n";
      }
    }
  }else{
    //HOW TO DO WITHOUT KNOWING SIZES
  }
}

void Path::makeCubicPath(const ramp_planner_new::TrajectoryRequest msg){
  double T = msg.timeNeeded; //add some extra cusion here if we want to
  findCubicCoefs(msg);
  if(order!=3 && coefs.size() != 4){
    return;
  }
  double x = msg.points.at(0).x;
  double y = msg.points.at(0).y;
  double z = msg.points.at(0).z;
  std::vector<double> starts = {x,y,z};
  double xInc = (msg.points.at(1).x - x)/T;
  double yInc = (msg.points.at(1).y - y)/T;
  double zInc = (msg.points.at(1).z - z)/T;
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
    addBefore(ms,msg.points.at(1));
  }
  std::cout<<"Cubic path has "<<msg_.points.size()<<" points\n";
  // std::cout<<"msg_:\n"<<buildPathMsg()<<std::endl;
}

void Path::setPathPoints(const ramp_planner_new::PathPoints pp){
  msg_.points.clear();
  // std::cout<<pp.points.size()<<std::endl;
  for(unsigned int i=0;i<pp.points.size();i++){
    if(pp.forBez.at(i)){
      KnotPoint kp(pp.points.at(i));
      msg_.points.push_back(kp.buildKnotPointMsg());
    }
  }
}
