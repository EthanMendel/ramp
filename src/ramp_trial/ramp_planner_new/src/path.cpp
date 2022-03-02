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
  std::cout<<"("<<b.motionState_.msg_.positions.at(0)<<","<<b.motionState_.msg_.positions.at(1)<<")";
  std::cout<<" <--> ";
  std::cout<<"("<<msg_.points.at(1).motionState.positions.at(0)<<","<<msg_.points.at(1).motionState.positions.at(1)<<")"<<std::endl;
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
    for(unsigned int i=0;i<uCoefs.size();i++){
      ramp_planner_new::Coefficient c;
      for(unsigned int j=0;j<uCoefs.at(i).size();j++){
        c.values.push_back(uCoefs.at(i).at(j));
      }
      result.uCoefficients.push_back(c);
    }
    result.totalTime=usedT_;
    result.startTime=startT_;
    result.active = true;
    result.type = type;
  }
  // std::cout<<result<<std::endl;
  return result;
}

const std::string Path::toString() const {
  std::ostringstream result;
  for(unsigned int i=0;i<msg_.points.size();i++) {
    result<<"\n  "<<i<<": "<<utility.toString(msg_.points[i]).c_str();
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
      hold.push_back( m1.msg_.positions.at(i) );
      hold.push_back( m2.msg_.positions.at(i) );
      coefs.push_back(hold);
      std::cout<<"A: "<<coefs.at(i).at(0)<<"\tB: "<<coefs.at(i).at(1)<<"\tC: "<<coefs.at(i).at(2)<<"\t\n";
    }
    ramp_planner_new::TrajectoryRequest uMsg;
    uMsg.type = "uCubic";
    uMsg.points.push_back(p0);
    uMsg.points.push_back(p2);
    for(unsigned int i=0;i<coefs.size();i++){
      if(coefs.at(i).at(0) == coefs.at(i).at(1)){
        uMsg.normVals.push_back(1);
      }else{
        uMsg.normVals.push_back(2*((coefs.at(i).at(1))-coefs.at(i).at(0)));
      }
    }
    uMsg.normVals.push_back(1);//extra value to not normalize z (theta)
    findCubicCoefs(uMsg);
    type = "bezier";
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
  if(msg.points.size() >= 3){
    usedT_ = utility.getMinLinTime(msg.points.at(0),msg.points.at(2));
    findBezierCoefs(msg.points.at(0),msg.points.at(1),msg.points.at(2));
    //use these to bound u on the interval [0,1]
    float xuMin = uCoefs.at(0).at(0)*pow(0,3) + uCoefs.at(0).at(1)*pow(0,2) + uCoefs.at(0).at(2)*(0) + uCoefs.at(0).at(3);
    float xuMax = (uCoefs.at(0).at(0)*pow(usedT_,3) + uCoefs.at(0).at(1)*pow(usedT_,2) + uCoefs.at(0).at(2)*(usedT_) + uCoefs.at(0).at(3)) - xuMin;
    float yuMin = uCoefs.at(1).at(0)*pow(0,3) + uCoefs.at(1).at(1)*pow(0,2) + uCoefs.at(1).at(2)*(0) + uCoefs.at(1).at(3);
    float yuMax = (uCoefs.at(1).at(0)*pow(usedT_,3) + uCoefs.at(1).at(1)*pow(usedT_,2) + uCoefs.at(1).at(2)*(usedT_) + uCoefs.at(1).at(3)) - yuMin;
    std::vector<std::vector<float>> uAdjs = {{xuMin,xuMax},{yuMin,yuMax}};
    for(float t=0;t<=usedT_;t+=resolution){
      MotionState ms;
      for(unsigned int j=0;j<2;j++){//run for x and y, but not z (representing theta)
        float u   = ((uCoefs.at(j).at(0)*pow(t,3) + uCoefs.at(j).at(1)*pow(t,2) + uCoefs.at(j).at(2)*(t) + uCoefs.at(j).at(3)) - uAdjs.at(j).at(0))/uAdjs.at(j).at(1);
        //TODO do uP and uPP need to be bounded on any interval?..
        float uP  = 3*uCoefs.at(j).at(0)*pow(t,2) + 2*uCoefs.at(j).at(1)*(t) + uCoefs.at(j).at(2);
        float uPP = 6*uCoefs.at(j).at(0)*(t) + 2*uCoefs.at(j).at(1);
        
        double A1 = 2*(coefs.at(j).at(0) - 2*coefs.at(j).at(1) + coefs.at(j).at(2));
        double A2 = 2*((coefs.at(j).at(1))-coefs.at(j).at(0));
        
        ms.msg_.positions.push_back( pow(1-u,2)*coefs.at(j).at(0) + u*(1-u)*2*coefs.at(j).at(1) + pow(u,2)*coefs.at(j).at(2) );
        
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
  type = msg.type;
  double T, Td;
  if(msg.points.size()== 2){//normal cubic
    T = utility.getMinLinTime(msg.points.at(0),msg.points.at(1));
    Td = 0;
  }else if(msg.points.size() == 3){//either entrecnce or exit vels need to be found
    std::cout<<"extra point:\n"<<msg.points.at(2)<<std::endl;
    T =  std::max(utility.getMinLinTime(msg.points.at(0),msg.points.at(2)),
                  utility.getMinLinTime(msg.points.at(1),msg.points.at(2)));
    Td = std::min(utility.getMinLinTime(msg.points.at(0),msg.points.at(2)),
                  utility.getMinLinTime(msg.points.at(1),msg.points.at(2)));
  }else if(msg.points.size() == 4){//both entrence and exit vels need to be found
    std::cout<<"extra points:\n"<<msg.points.at(2)<<std::endl;
    std::cout<<"\n"<<msg.points.at(3)<<std::endl;
    uCubicEntrenceVelocities.clear();
    T = utility.getMinLinTime(msg.points.at(2),msg.points.at(3));
    Td = utility.getMinLinTime(msg.points.at(1),msg.points.at(3));
  }else{
    std::cout<<"dont know what to do in findCubicCoefs with "<<msg.points.size()<<" points"<<std::endl;
    return;
  }
  usedT_ = T;
  usedTdelta_ = Td;
  if(msg.points.size() == 4){
    startT_ = utility.getMinLinTime(msg.points.at(2),msg.points.at(0));
  }else if(uCubicEntrenceVelocities.size() > 0 && msg.type == "cubic" && !msg.swapped){
    startT_ = usedTdelta_;
  }else{
    startT_ = 0;
  }
  std::cout<<"\t"<<usedT_<<" seconds with a delta of "<<usedTdelta_<<" starting at t="<<startT_<<std::endl;
  if(type == "cubic"){
    for(auto c : coefs){
      c.clear();
    }
    coefs.clear();
    // uCubicEntrenceVelocities.clear();
  }else{
    for(auto c : uCoefs){
      c.clear();
    }
    uCoefs.clear();
  }
  if(msg.points.size() >= 2){
    MotionState start = msg.points.at(0);
    MotionState goal = msg.points.at(1);
    if(type == "uCubic"){
      start.msg_.positions.at(0) = 0;
      start.msg_.positions.at(1) = 0;
      goal.msg_.positions.at(0) = 1;
      goal.msg_.positions.at(1) = 1;
    }
    if(msg.points.size() == 3){
      if(uCubicEntrenceVelocities.size() > 0 && !msg.swapped){
        start = msg.points.at(2);
        // startT_ += .4;
      }else{
        goal = msg.points.at(2);
        // usedTdelta_ += .3;
      }
    }else if(msg.points.size() == 4){
      start = msg.points.at(2);
      goal = msg.points.at(3);
    }else if(msg.points.size() >= 5){
      std::cout<<"more than 4 points ("<<msg.points.size()<<") when finding cubic.. returning"<<std::endl;
      return;
    }
    if(uCubicEntrenceVelocities.size() > 0){
      if(type == "uCubic"){
        for(unsigned int j=0;j<uCubicEntrenceVelocities.size();j++){
          start.msg_.velocities.at(j) = uCubicEntrenceVelocities.at(j)/msg.normVals.at(j);
          goal.msg_.velocities.at(j) = uCubicEntrenceVelocities.at(j)/msg.normVals.at(j);
        }
      }else if(msg.swapped){
        std::cout<<"##setting starting vels for new first cubic##"<<std::endl;
        for(unsigned int j=0;j<uCubicEntrenceVelocities.size();j++){
          start.msg_.velocities.at(j) = msg.startingVels.at(j);
          goal.msg_.velocities.at(j) = msg.startingVels.at(j);
        }
      }
    }
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
  findCubicCoefs(msg);
  if(order!=3 && coefs.size() != 4){
    return;
  }

  std::cout<<"\t"<<usedT_<<" seconds with a delta of "<<usedTdelta_<<" starting at t="<<startT_<<" ending at t="<<usedT_-usedTdelta_<<std::endl;
  for(double t = startT_;t<usedT_;t+=.1){
    if(t >= usedT_ - usedTdelta_ && msg.hasNext){
      uCubicEntrenceVelocities.clear();
      std::cout<<"setting entrence velocities"<<std::endl;
      for(unsigned int j=0;j<coefs.size();j++){
        uCubicEntrenceVelocities.push_back(3*coefs.at(j).at(0)*pow(t,2) + 2*coefs.at(j).at(1)*(t) + coefs.at(j).at(2));
      }
      usedT_ = usedT_ - usedTdelta_;
      std::cout<<"new time set to "<<usedT_<<" sec.."<<std::endl;
      break;
    }
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
  std::cout<<"adding "<<pp.points.size()<<" pathPoints"<<std::endl;
  for(unsigned int i=0;i<pp.points.size();i++){
    KnotPoint kp(pp.points.at(i));
    ramp_msgs::KnotPoint rkp(kp.buildKnotPointMsg());
    std::cout<<"\ttesting "<<rkp.motionState.positions.at(0)<<","<<rkp.motionState.positions.at(1)<<std::endl;    
    auto pos = std::find(msg_.points.begin(), msg_.points.end(), rkp);
    bool found = pos != msg_.points.end();
    if(found && !pp.forBez.at(i)){
      std::cout<<"\t\tFound, need to remove"<<std::endl;
      msg_.points.erase(pos);
    }else{
      if(!found && pp.forBez.at(i)){
        std::cout<<"\t\tnot found, need to add"<<std::endl;
        bool added = false;
        for(unsigned int j=i;j<pp.points.size();j++){
          KnotPoint kp2(pp.points.at(j));
          ramp_msgs::KnotPoint rkp2(kp2.buildKnotPointMsg());
          auto pos2 = std::find(msg_.points.begin(), msg_.points.end(), rkp2);
          bool found2 = pos2 != msg_.points.end();
          if(found2){
            std::cout<<"\t\tfound point to add before"<<std::endl;
            addBefore(rkp,rkp2);
            added = true;
            break;
          }
        }
        if(!added){
          std::cout<<"\t\tno point to add before, adding to the end"<<std::endl;
          msg_.points.push_back(rkp);
        }
      }
    }
  }
}
