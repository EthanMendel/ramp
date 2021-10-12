#include "../include/path.h"
#include "Polyfit.cpp"

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

/**
 * y = ax^3 + d     p1 = (m,n)    p2 = (u,v)
 * a = (y - d) / x^3  &  d = y - ax^3
 * 
 * a = (n - d) / m^3  &  d = v - au^3
 * 
 * a = [n - (v - au^3)] / m^3
 * am^3 = n - v + au^3
 * am^3 - au^3 = n - v
 * a(m^3 - u^3) = n - v
 * 
 * a = (n - v) / (m^3 - u^3)
 * */
void Path::findCubicCoefs(){
  order = 3;
  coefs.clear();
  if(msg_.points.size() >= 2){
    double m = msg_.points.at(0).motionState.positions.at(0);
    double n = msg_.points.at(0).motionState.positions.at(1);
    double u = msg_.points.at(msg_.points.size() - 1).motionState.positions.at(0);
    double v = msg_.points.at(msg_.points.size() - 1).motionState.positions.at(1);
    coefs.push_back((n - v) / (pow(m,3) - pow(u,3)));
    coefs.push_back(0);
    coefs.push_back(0);
    coefs.push_back(v - coefs.at(0) * pow(u,3));
  }else{
    coefs.push_back(0);
    coefs.push_back(0);
    coefs.push_back(0);
    coefs.push_back(0);
  }
  std::cout<<"A: "<<coefs.at(0)<<"\nB: "<<coefs.at(1)<<"\nC: "<<coefs.at(2)<<"\nD: "<<coefs.at(3)<<"\n";
}

//logic from https://www.geeksforgeeks.org/form-the-cubic-equation-from-the-given-roots/
//NOTE: this method assumes that the start and goal are zeros and form a straight line path
//->this cubic uses the start-goal-straight-line as the x-axis
//MEANING->using this method, the linear coefs will be needed to convert to the actual coorisponding y point
//         that should be used
void Path::findCubicCoefs2(){
  order = 3;
  coefs.clear();
  if(msg_.points.size() >= 2){
    double h1 = msg_.points.at(0).motionState.positions.at(0);
    double h3 = msg_.points.at(msg_.points.size() -1).motionState.positions.at(0);
    double h2 = (h1+h3)/2.0;
    double X = (h1 + h2 + h3);
    double Y = (h1 * h2) + (h2 * h3) + (h3 * h1);
    double Z = h1 * h2 * h3;
    coefs.push_back(1);
    coefs.push_back(-1 * X);
    coefs.push_back(Y);
    coefs.push_back(-1 * Z);
  }else{
    coefs.push_back(0);
    coefs.push_back(0);
    coefs.push_back(0);
    coefs.push_back(0);
  }
  std::cout<<"A: "<<coefs.at(0)<<"\nB: "<<coefs.at(1)<<"\nC: "<<coefs.at(2)<<"\nD: "<<coefs.at(3)<<"\n";
}

void Path::findCubicCoefs3(){
  order = 3;
  coefs.clear();
  if(msg_.points.size() >= 4){
    // Input values
    // **************************************************************
    size_t k = 2;                                    // Polynomial order
    bool fixedinter = false;                         // Fixed the intercept (coefficient A0)
    int wtype = 0;                                   // Weight: 0 = none (default), 1 = sigma, 2 = 1/sigma^2
    double fixedinterval = 0.;                       // The fixed intercept value (if applicable)
    double alphaval = 0.05;                          // Critical apha value
    std::vector<double> x;
    std::vector<double> y;
    for(unsigned int i=0;i<msg_.points.size();i++){
      x.push_back(msg_.points.at(i).motionState.positions.at(0));
      y.push_back(msg_.points.at(i).motionState.positions.at(1));
    }
    // Definition of other variables
    // **************************************************************
    size_t n = 0;                                    // Number of data points (adjusted later)
    size_t nstar = 0;                                // equal to n (fixed intercept) or (n-1) not fixed
    double coefbeta[k+1];                            // Coefficients of the polynomial
    double serbeta[k+1];                             // Standard error on coefficients
    double tstudentval = 0.;                         // Student t value
    double SE = 0.;                                  // Standard error
    double **XTWXInv;                                // Matrix XTWX Inverse [k+1,k+1]
    double **Weights;                                // Matrix Weights [n,n]
    // Initialize values
    // **************************************************************
    n = sizeof(x)/sizeof(double);
    nstar = n-1;
    XTWXInv = Make2DArray(k+1,k+1);
    Weights = Make2DArray(n,n);
    // Build the weight matrix
    // **************************************************************
    CalculateWeights(double err[], Weights, n, wtype);
    PolyFit(x,y,n,k,fixedinter,fixedinterval,coefbeta,Weights,XTWXInv);


  }else{
    coefs.push_back(0);
    coefs.push_back(0);
    coefs.push_back(0);
    coefs.push_back(0);
  }
  std::cout<<"A: "<<coefs.at(0)<<"\nB: "<<coefs.at(1)<<"\nC: "<<coefs.at(2)<<"\nD: "<<coefs.at(3)<<"\n";
}

void Path::makeCubicPath(){
  findCubicCoefs2();
  if(order!=3 && coefs.size() != 4){
    return;
  }
  double x = msg_.points.at(0).motionState.positions.at(0);
  double inc = (msg_.points.at(msg_.points.size() - 1).motionState.positions.at(0) - x)/10.0;
  for(unsigned int i=0;i<11;i++){
    MotionState ms;
    ms.msg_.positions.push_back(x+(i*inc));
    ms.msg_.positions.push_back(coefs.at(0)*pow(x+(i*inc),3)+coefs.at(1)*pow(x+(i*inc),2)+
                                coefs.at(2)*(x+(i*inc)) + coefs.at(3));
    ms.msg_.velocities.push_back(0);
    ms.msg_.accelerations.push_back(0);
    ms.msg_.jerks.push_back(0);
    // std::cout<<"point #"<<i+1<<"\t("<<ms.msg_.positions.at(0)<<",\t"<<ms.msg_.positions.at(1)<<")\n";
    KnotPoint kp(ms);
    msg_.points.push_back(kp.buildKnotPointMsg());
  }
  std::cout<<"Cubic path has "<<msg_.points.size()<<" points\n";
}
