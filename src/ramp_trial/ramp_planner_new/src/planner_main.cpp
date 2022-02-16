#include "ros/ros.h"
#include "../include/planner.h"
#include <visualization_msgs/MarkerArray.h>
#include <ramp_planner_new/TrajectoryRepresentation.h>
#include <ramp_planner_new/TrajectoryRequest.h>
#include <ramp_planner_new/BezifyRequest.h>
#include <ramp_planner_new/TrajectorySwap.h>
 
Utility utility;

int                 id;
int                 curStartId, curGoalId;
std::vector<MotionState> pathMotionStates;
ramp_planner_new::PathPoints pathPoints;
Path                plannerPath;
bool                readyToPubPath;
std::vector<Range>  ranges;
double              radius;
int                 population_size;
int                 num_ppcs;
bool                sensingBeforeCC;
bool                sub_populations;
bool                modifications;
bool                evaluations;
bool                seedPopulation;
bool                errorReduction;
bool                only_sensing;
bool                moving_robot;
bool                shrink_ranges;
bool                stop_after_ppcs;
bool                show_full_traj;
bool                try_ic_loop;
double              t_cc_rate;
double              t_sc_rate;
double              T_weight, A_weight, D_weight;
int                 pop_type;
TrajectoryType      pt;
std::vector<std::string> ob_topics;
std::string         global_frame;
std::string         update_topic;
ros::Publisher      pub_markerArray;
ros::Publisher      pub_coefs;
ros::Publisher      pub_path_points;
ros::Publisher      rviz_pub_path_points;


float costmap_width, costmap_height, costmap_origin_x, costmap_origin_y;

bool use_start_param;
bool start_planner;
bool use_hilbert_map;
bool use_odom_topics;

// initializes a vector of Ranges
// NOTE: must be called *AFTER* radius is set
void initDOF(const std::vector<double> dof_min, const std::vector<double> dof_max){
  for(unsigned int i=0;i<dof_min.size();i++) {
    Range temp(dof_min.at(i), dof_max.at(i));
    if(shrink_ranges){
      temp.msg_.min += radius;
      temp.msg_.max -= radius;
    }
    ranges.push_back(temp); 
  }
}

// initializes global start and goal
void initStartGoal(const std::vector<std::vector<float>> points) {
  pathMotionStates.clear();
  plannerPath.msg_.points.clear();
  double pastY;
  for(unsigned int i=0;i<points.size();i++){
    MotionState point;
    std::vector<float> p = points.at(i);
    for(unsigned int j=0;j<p.size();j++) {
      point.msg_.positions.push_back(p.at(j));
      point.msg_.velocities.push_back(0);
      point.msg_.accelerations.push_back(0);
      point.msg_.jerks.push_back(0);
    }
    if(i == 0){
      pastY = point.msg_.positions.at(1);
    }else{
      if(pastY == point.msg_.positions.at(1)){
        point.msg_.positions.at(1)+=.00001;
        std::cout<<"\t**consecutive y values.. adding .00001 to subsequent one"<<std::endl;
      }
      pastY = point.msg_.positions.at(1);
    }
    pathMotionStates.push_back(point);
    KnotPoint pkp(point);
    plannerPath.msg_.points.push_back(pkp.buildKnotPointMsg());
  }
  // std::cout<<"points at init:\n"<<plannerPath.buildPathMsg()<<std::endl;
}

 /** loads all ros parameters from .yaml 
 *  Calls initDOF, initStartGoal */
void loadParameters(const ros::NodeHandle handle){
  std::cout<<"\nLoading parameters\n";
  std::cout<<"\nHandle NS: "<<handle.getNamespace();

  std::string key;
  std::vector<double> dof_min;
  std::vector<double> dof_max;

  // id of the robot
  if(handle.hasParam("robot_info/id")) {
    handle.getParam("robot_info/id", id);
  }else {}
  // radius of the robot
  if(handle.hasParam("robot_info/radius")) {
    handle.getParam("robot_info/radius", radius);
  }else {}

  if(handle.hasParam("ramp/global_frame")){
    handle.getParam("ramp/global_frame", global_frame);
  }else {}

  if(handle.hasParam("ramp/update_topic")){
    handle.getParam("ramp/update_topic", update_topic);
  }else {}
  
  if(handle.hasParam("ramp/shrink_ranges")){
    handle.getParam("ramp/shrink_ranges", shrink_ranges);
    std::cout<<"\nshrink_ranges: "<<shrink_ranges;
  }

  if(handle.hasParam("ramp/use_start_param")){
    handle.getParam("ramp/use_start_param", use_start_param);
    std::cout<<"\nuse_start_param: "<<use_start_param;
  }

  if(handle.hasParam("ramp/use_hilbert_map")){
    handle.getParam("ramp/use_hilbert_map", use_hilbert_map);
    std::cout<<"\nuse_hilbert_map: "<<use_hilbert_map;
  }

  // dofs
  if(handle.hasParam("robot_info/DOF_min") && 
      handle.hasParam("robot_info/DOF_max")) {
    handle.getParam("robot_info/DOF_min", dof_min); 
    handle.getParam("robot_info/DOF_max", dof_max); 
    initDOF(dof_min, dof_max);
  }else {
    ROS_ERROR("Did not find parameters robot_info/DOF_min, robot_info/DOF_max");
    exit(1);
  }

  if(handle.hasParam("robot_info/max_speed_linear")){
    handle.getParam("robot_info/max_speed_linear", utility.max_speed_linear_);
  }else{
    ROS_ERROR("Did not find robot_info/max_speed_linear rosparam");
    exit(1);
  }
  if(handle.hasParam("robot_info/max_speed_angular")){
    handle.getParam("robot_info/max_speed_angular", utility.max_speed_angular_);
  }else{
    ROS_ERROR("Did not find robot_info/max_speed_angular rosparam");
    exit(1);
  }
  if(handle.hasParam("robot_info/max_acceleration")){
    handle.getParam("robot_info/max_acceleration", utility.max_acceleration_);
  }else{
    ROS_ERROR("Did not find robot_info/max_acceleration rosparam");
    exit(1);
  }
  
  // start and goal vectors
  if(handle.hasParam("robot_info/start") &&
      handle.hasParam("robot_info/goal")){
    std::vector<float> p_start;
    std::vector<float> p_goal;
    std::vector<float> p_waypoint;
    std::vector<float> p_waypoint2;
    handle.getParam("robot_info/start", p_start);
    handle.getParam("robot_info/goal",  p_goal );
    handle.getParam("robot_info/waypoint", p_waypoint);
    handle.getParam("robot_info/waypoint2", p_waypoint2);
    initStartGoal({p_start, p_waypoint, p_waypoint2, p_goal});
  }else {
    ROS_ERROR("Did not find parameters robot_info/start, robot_info/goal");
    exit(1);
  }

  if(handle.hasParam("ramp/population_size")) {
    handle.getParam("ramp/population_size", population_size);
    std::cout<<"\npopulation_size: "<<population_size;
  }

  if(handle.hasParam("ramp/sub_populations")) {
    handle.getParam("ramp/sub_populations", sub_populations);
    std::cout<<"\nsub_populations: "<<sub_populations;
  }
  
  if(handle.hasParam("ramp/modifications")) {
    handle.getParam("ramp/modifications", modifications);
    std::cout<<"\nmodifications: "<<modifications;
  }
    
  if(handle.hasParam("ramp/seed_population")) {
    handle.getParam("ramp/seed_population", seedPopulation);
    std::cout<<"\nseed_population: "<<seedPopulation;
  }
    
  if(handle.hasParam("ramp/pop_traj_type")) {
    handle.getParam("ramp/pop_traj_type", pop_type);
    switch (pop_type) {
      case 0:
        pt = HOLONOMIC;
        break;
      case 1:
        pt = HYBRID;
        break;
    }
  }

  if(handle.hasParam("ramp/show_full_traj")){
    handle.getParam("ramp/show_full_traj", show_full_traj);
    ROS_INFO("show_full_traj: %s", show_full_traj ? "True" : "False");
  }

  std::cout<<"\n------- Done loading parameters -------\n";
    std::cout<<"\n  ID: "<<id;
    // std::cout<<"\n  Start: "<<start.toString();
    // std::cout<<"\n  Goal: "<<goal.toString();
    std::cout<<"\n  Ranges: ";
    for(uint8_t i=0;i<ranges.size();i++) {
      std::cout<<"\n  "<<i<<": "<<ranges.at(i).toString();
    }
  std::cout<<"\n---------------------------------------";
}

void pubStartGoalMarkers(){
  ROS_INFO("In pubStartGoalMarkers");
  visualization_msgs::MarkerArray result;

  // markers for both positions
  for(unsigned int i=0;i<pathMotionStates.size();i++){
    visualization_msgs::Marker marker;
    marker.header.stamp = ros::Time::now();
    if(i==0){
      marker.id = 10001;
    } else {
      marker.id = 10001 + i;
    }
    marker.header.frame_id = global_frame;
    marker.ns = "basic_shapes";
    marker.type = visualization_msgs::Marker::SPHERE;
    marker.action = visualization_msgs::Marker::ADD;
    // set positions
    marker.pose.position.x = pathMotionStates.at(i).msg_.positions[0];
    marker.pose.position.y = pathMotionStates.at(i).msg_.positions[1];
    marker.pose.position.z = 0.0;
    // set orientations
    marker.pose.orientation.x = 0.0;
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 1.0;
    // set radii
    marker.scale.x = 0.1;
    marker.scale.y = 0.1;
    marker.scale.z = 0.1;
    // set colors
    marker.color.r = 1;
    marker.color.g = 0;
    marker.color.b = 0;
    marker.color.a = 1;
    // set lifetimes
    marker.lifetime = ros::Duration(120.0);

    result.markers.push_back(marker);
  }
  visualization_msgs::Marker origin_marker;

  origin_marker.id = 10000;
  origin_marker.header.frame_id = global_frame;
  origin_marker.ns = "basic_shapes";
  origin_marker.type = visualization_msgs::Marker::SPHERE;
  origin_marker.action = visualization_msgs::Marker::ADD;
  origin_marker.pose.position.x = 0.0;
  origin_marker.pose.position.y = 0.0;
  origin_marker.pose.position.z = 0.1;
  origin_marker.pose.orientation.x = 0.0;
  origin_marker.pose.orientation.y = 0.0;
  origin_marker.pose.orientation.z = 0.0;
  origin_marker.pose.orientation.w = 1.0;
  origin_marker.scale.x = 0.1;
  origin_marker.scale.y = 0.1;
  origin_marker.scale.z = 0.0;
  origin_marker.color.r = 0;
  origin_marker.color.g = 1;
  origin_marker.color.b = 0;
  origin_marker.color.a = 1;
  origin_marker.lifetime = ros::Duration(120.0);

  ramp_planner_new::PathPoints pps;
  pps.markers = result.markers;
  for(unsigned int i=0;i<result.markers.size()-1;i++){//populate type and forBez arrays
    pps.types.push_back("cubic");
    pps.forBez.push_back(true);
  }
  pps.forBez.push_back(true);//extra value needed not included above
  
  result.markers.push_back(origin_marker); // add origin onto rviz path points
  rviz_pub_path_points.publish(result);
  rviz_pub_path_points.publish(result);
  pub_path_points.publish(pps);
  pub_path_points.publish(pps);
  
  ROS_INFO("Exiting pubStartGoalMarkers");
}

void pubPath(){
  // ROS_INFO("In pubPath");
  visualization_msgs::MarkerArray result;
  while(plannerPath.msg_.points.size()<=pathMotionStates.size()){//make sure we have a path to publish
    ros::spinOnce();
  }

  for(unsigned int i=0;i<plannerPath.msg_.points.size()-1;i++) {
    // std::cout<<plannerPath.msg_.points.at(i).motionState.positions.at(0)<<"\t\t"<<plannerPath.msg_.points.at(i).motionState.positions.at(1)<<std::endl;
    // markers for both positions
    visualization_msgs::Marker mp_marker;

    mp_marker.header.stamp = ros::Time::now();
    mp_marker.id = 20000 + i;

    mp_marker.header.frame_id = global_frame;

    mp_marker.ns = "points_and_lines";

    mp_marker.type = visualization_msgs::Marker::LINE_STRIP;

    mp_marker.action = visualization_msgs::Marker::ADD;
    
    // first point to create line start
    geometry_msgs::Point first;
    first.x = plannerPath.msg_.points[i].motionState.positions[0];
    first.y = plannerPath.msg_.points[i].motionState.positions[1];
    first.z = 0.0;
    mp_marker.points.push_back(first);

    // next point to create line end
    geometry_msgs::Point next;
    next.x = plannerPath.msg_.points[i+1].motionState.positions[0];
    next.y = plannerPath.msg_.points[i+1].motionState.positions[1];
    next.z = 0.0;
    mp_marker.points.push_back(next);

    // std::cout<<"segment "<<i+1<<" from ("<<first.x<<", "<<first.y<<", "<<first.z<<
    // ") to ("<<next.x<<", "<<next.y<<", "<<next.z<<")"<<std::endl;
    
    // set orientations
    mp_marker.pose.orientation.x = 0.0;
    mp_marker.pose.orientation.y = 0.0;
    mp_marker.pose.orientation.z = 0.0;
    mp_marker.pose.orientation.w = 1.0;
  
    // set radii
    mp_marker.scale.x = 0.1;
    mp_marker.scale.y = 0.1;
    mp_marker.scale.z = 0.0;
  
    // set colors
    //    different colors help visualize the order of the path
    switch(i%3){
      case 0:
        mp_marker.color.r = 1;
        mp_marker.color.g = 0;
        mp_marker.color.b = 0;
        break;
      case 1:
        mp_marker.color.r = 0;
        mp_marker.color.g = 1;
        mp_marker.color.b = 0;
        break;
      case 2:
        mp_marker.color.r = 0;
        mp_marker.color.g = 0;
        mp_marker.color.b = 1;
        break;
    }
    mp_marker.color.a = 1;
  
    // set lifetimes
    mp_marker.lifetime = ros::Duration(120.0);

    // create marker array and publish
    result.markers.push_back(mp_marker);
  }

  pub_markerArray.publish(result);
  pub_markerArray.publish(result);
  
  // ROS_INFO("Exiting pubPath");
}

void getTrajectory(ramp_planner_new::TrajectoryRequest msg){
  std::cout<<"getting "<<msg.type<<" trajectory"<<std::endl;
  std::cout<<"start:\n"<<msg.points.at(0)<<std::endl;
  if(msg.type == "cubic"){
      std::cout<<"goal:\n"<<msg.points.at(1)<<std::endl;
      plannerPath.makeCubicPath(msg);
  }else if(msg.type == "bezier"){
      std::cout<<"mid:\n"<<msg.points.at(1)<<std::endl;
      std::cout<<"goal:\n"<<msg.points.at(2)<<std::endl;
      plannerPath.makeBezierPath(msg);
  }else{
      std::cout<<"foud a u trajectory in planner, something went wrong"<<std::endl;
      return;
  }
  readyToPubPath = true;
}

bool acceptableAngTime(const geometry_msgs::Point& p0, const geometry_msgs::Point p1, const geometry_msgs::Point p2){
    plannerPath.setUsedT(utility.getMinLinTime(p0,p2));
    plannerPath.findBezierCoefs(p0,p1,p2);
    std::cout<<plannerPath.coefs.size()<<" coefs"<<std::endl;
    std::cout<<plannerPath.uCoefs.size()<<" uCoefs"<<std::endl;
    // Equations based on "Real-time Adaptive Non-holonomic Motion Planning in Unknown Dynamic Environments"
    double A1 = 2*(plannerPath.coefs.at(0).at(0) - 2*plannerPath.coefs.at(0).at(1) + plannerPath.coefs.at(0).at(2));//Section II, Equation (3)
    double B1 = 2*(plannerPath.coefs.at(1).at(0) - 2*plannerPath.coefs.at(1).at(1) + plannerPath.coefs.at(1).at(2));
    double A2 = 2*(plannerPath.coefs.at(0).at(1) - plannerPath.coefs.at(0).at(0));
    double B2 = 2*(plannerPath.coefs.at(1).at(1) - plannerPath.coefs.at(1).at(0));
    if(A1 == 0 || B1 == 0 || (A2 == 0 && B2 == 0)){
      std::cout<<"\t**A || B || C && D == 0"<<std::endl;
      std::cout<<"\tA: "<<A1<<"\tB: "<<B1<<"\tC: "<<A2<<"\tD: "<<B2<<"\n";
      return false;
    }
    //Equations based on "On-line Planning of Nonholonomic Trajectories in Crowded and Geometrically Unknown Environments*"
    double t = - ((A1*A2 + B1*B2) / (pow(A1,2) + pow(B1,2))); //point of maximum angular velocity, Section II, Equation (6)
    if(t < 0 || t > 1){
      std::cout<<"\tt<0 || t>1"<<std::endl;
      std::cout<<"\tt:"<<t<<std::endl;
      return false;
    }
    float xuP = 3*plannerPath.uCoefs.at(0).at(0)*pow(t,2) + 2*plannerPath.uCoefs.at(0).at(1)*(t) + plannerPath.uCoefs.at(0).at(2);
    float yuP = 3*plannerPath.uCoefs.at(1).at(0)*pow(t,2) + 2*plannerPath.uCoefs.at(1).at(1)*(t) + plannerPath.uCoefs.at(1).at(2);
    double xVel =((A1*t + A2)*xuP);
    double yVel =((B1*t + B2)*yuP);
    double linVel = sqrt(pow(xVel,2)+pow(yVel,2));
    if(linVel > utility.max_speed_linear_){
      std::cout<<"\tlinVel too high: "<<linVel<<std::endl;
      return false;
    }
    double numerator1 = (pow(A1,2) + pow(B1,2)) * pow(t,2);
    double numerator2 = 2 * ((A1*A2) + (B1*B2)) * t;
    double numerator3 = pow(A2,2) + pow(B2,2);
    double numerator  = pow(numerator1 + numerator2 + numerator3, 3);
    double denominator= pow((B1*A2) - (A1*B2), 2);
    double R_min_     = sqrt(numerator / denominator);
    double angVel = linVel / R_min_;
    //TODO make sure this is the correct angVel value
    if(angVel >= ((2.f*PI)/3.f)){
      std::cout<<"\tangVel too high: "<<angVel<<std::endl;
      return false;
    }
    return true;
}

//make a marker to be published based on a given point and requested id
visualization_msgs::Marker makeMarker(geometry_msgs::Point p, int id){
    visualization_msgs::Marker marker;
    marker.header.stamp = ros::Time::now();
    marker.id = id;
    
    marker.header.frame_id = "map";
    marker.ns = "basic_shapes";
    marker.type = visualization_msgs::Marker::SPHERE;
    marker.action = visualization_msgs::Marker::ADD;
    // set positions
    marker.pose.position.x = p.x;
    marker.pose.position.y = p.y;
    marker.pose.position.z = 0.0;
    // set orientations
    marker.pose.orientation.x = 0.0;
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 1.0;
    // set radii
    marker.scale.x = 0.1;
    marker.scale.y = 0.1;
    marker.scale.z = 0.1;
    // set colors
    marker.color.r = 1;
    marker.color.g = 0;
    marker.color.b = 0;
    marker.color.a = 1;
    // set lifetimes
    marker.lifetime = ros::Duration(120.0);

    return marker;
}

//add the given control points to the overall path on either side of the given marker to 'replace' the marker and 'bezify' the overall path
ramp_planner_new::PathPoints addControlPoints(visualization_msgs::Marker m, geometry_msgs::Point cp1, geometry_msgs::Point cp2){
    visualization_msgs::MarkerArray maRes;//result vars
    std::vector<std::string> tRes;
    std::vector<unsigned char> bRes;
    int replaceId = -1;//flag vars
    bool replaced = false;
    for(unsigned int i=0;i<pathPoints.markers.size();i++){
        if(!replaced){//before finding marker to 'replace'
            if(pathPoints.markers.at(i) == m){//if marker marker
                replaceId = m.id - i;//'replace' marker
                maRes.markers.push_back(makeMarker(cp1,replaceId + i));//add first control point before marker
                pathPoints.markers.at(i).id = replaceId + i + 1;//edit marker id to account for movement change
                pathPoints.markers.at(i).color.r = 0;
                pathPoints.markers.at(i).color.b = 1;
                maRes.markers.push_back(pathPoints.markers.at(i));
                maRes.markers.push_back(makeMarker(cp2,replaceId + i + 2));//add second control point after marker
                tRes.push_back("bezier");//add info about new points
                tRes.push_back(pathPoints.types.at(i-1));
                bRes.push_back(true);
                bRes.push_back(false);
                bRes.push_back(true);
                replaced = true;
            }else{//else
                maRes.markers.push_back(pathPoints.markers.at(i));//add with no changes
                tRes.push_back(pathPoints.types.at(i));
                bRes.push_back(pathPoints.forBez.at(i));
            }
        }else{//already found marker to 'replace'
            pathPoints.markers.at(i).id = replaceId + i + 2;//edit marker id to accoutn for movement chagne
            maRes.markers.push_back(pathPoints.markers.at(i));
            if(i < pathPoints.types.size()){//make sure not out-of-bounds
                tRes.push_back(pathPoints.types.at(i));
            }
            bRes.push_back(pathPoints.forBez.at(i));
        }
    }
    ramp_planner_new::PathPoints result;
    result.markers = maRes.markers;
    result.types = tRes;
    result.forBez = bRes;
    for(unsigned int i=0;i<result.markers.size();i++){
      result.points.push_back(result.markers.at(i).pose.position);
    }
    return result;
}

void bezify(const ramp_planner_new::BezifyRequest& br){
  std::cout<<"***bezifying.."<<std::endl;
  pathPoints = br.pathPoints;
  if(br.markers.size() == 3){
    visualization_msgs::Marker m0 = br.markers.at(0);
    visualization_msgs::Marker m1 = br.markers.at(1);
    visualization_msgs::Marker m2 = br.markers.at(2);
    
    geometry_msgs::Point p0,p1,p2;
    p0 = m0.pose.position;
    p1 = m1.pose.position;
    p2 = m2.pose.position;
    //get maximum allowed distance
    double D1 = utility.getEuclideanDist({p0.x,p0.y},{p1.x,p1.y});
    double D2 = utility.getEuclideanDist({p1.x,p1.y},{p2.x,p2.y});
    double D = std::min(D1,D2);

    //get linear equations to find intersecting points
    double v1[] = {p1.x - p0.x, p1.y - p0.y};
    double normFactor1 = sqrt(pow(v1[0],2) + pow(v1[1],2));
    double u1[] = {v1[0]/normFactor1, v1[1]/normFactor1};
    double v2[] = {p2.x - p1.x, p2.y - p1.y};
    double normFactor2 = sqrt(pow(v2[0],2) + pow(v2[1],2));
    double u2[] = {v2[0]/normFactor2, v2[1]/normFactor2};
    //find new control points
    geometry_msgs::Point cp1,cp2;
    float d;
    for(d=.4;d<=D;d+=.1){//for all distences (incrimented as 10ths)
        cp1.x = p1.x - d*u1[0];
        cp1.y = p1.y - d*u1[1];
        cp2.x = p1.x + d*u2[0];
        cp2.y = p1.y + d*u2[1];
        std::cout<<"\tD: "<<D<<std::endl;
	      std::cout<<"\td1: "<<utility.getEuclideanDist({cp1.x,cp1.y},{p1.x,p1.y})<<std::endl;
	      std::cout<<"\td2: "<<utility.getEuclideanDist({cp2.x,cp2.y},{p1.x,p1.y})<<std::endl;
        //find bezier based on control and test if its okay
        if(acceptableAngTime(cp1,p1,cp2)){
            std::cout<<"**found good bezier where d="<<d<<"**"<<std::endl;
            break;
        }
    }
    if(d > D){
      std::cout<<"**could not find good bezier**"<<std::endl;
      return;
    }
    pathPoints = addControlPoints(m1,cp1,cp2);
    plannerPath.setPathPoints(pathPoints);
  }
  visualization_msgs::MarkerArray ma;
  ma.markers = pathPoints.markers;
  rviz_pub_path_points.publish(ma);
  rviz_pub_path_points.publish(ma);
  // for(unsigned int i=0;i<ma.markers.size();i++){
  //   std::cout<<"marker "<<i<<":\n"<<ma.markers.at(i).pose.position<<std::endl;
  // }
  pub_path_points.publish(pathPoints);
  pub_path_points.publish(pathPoints);
}

void swapTrajectory(ramp_planner_new::TrajectorySwap msg){
  std::cout<<"##swapping trajectory##"<<std::endl;
  std::vector<std::vector<float>> points;
  for(unsigned int i=0;i<msg.points.size();i++){
    std::vector<float> p;
    p.push_back(msg.points.at(i).x);
    p.push_back(msg.points.at(i).y);
    p.push_back(0);
    // std::cout<<"\t"<<msg.points.at(i)<<std::endl;
    points.push_back(p);
  }
  initStartGoal(points);
  pubStartGoalMarkers();
}

int main(int argc, char** argv) {
  std::cout<<"\nstarting main\n";
  srand( time(0));

  ros::init(argc, argv, "ramp_planner_new");
  ros::NodeHandle handle;

  ros::param::set("ramp/cc_started", false);
  std::cout<<"\nHandle namespace: "<<handle.getNamespace();
  
  // load ros parameters
  loadParameters(handle);
  plannerPath.utility = utility;
  ROS_INFO("Done loading rosparams");
  
  pub_markerArray = handle.advertise<visualization_msgs::MarkerArray>("visualization_marker_array", 10);
  pub_coefs = handle.advertise<ramp_planner_new::TrajectoryRepresentation>("coef_channel", 10);
  pub_path_points = handle.advertise<ramp_planner_new::PathPoints>("path_points_channel",10);
  rviz_pub_path_points = handle.advertise<visualization_msgs::MarkerArray>("rviz_path_points",10);
  ros::Subscriber trajReq = handle.subscribe("/traj_req", 1, getTrajectory);
  ros::Subscriber bezifyListener  = handle.subscribe("bezify_request", 1, bezify);
  ros::Subscriber trajSwap = handle.subscribe("traj_swap",1,swapTrajectory);

  ros::Duration d(0.5);
  d.sleep();
  /*
   * check that the start and goal are within specified ranges
   */
  // for(int i=0;i<ranges.size();i++){
  //   if( start.msg_.positions[i] < ranges[i].msg_.min || start.msg_.positions[i] > ranges[i].msg_.max ||
  //       goal.msg_.positions[i] < ranges[i].msg_.min || goal.msg_.positions[i] > ranges[i].msg_.max ){
  //     ROS_ERROR("Either the Start or goal position is not within DOF ranges, exiting ramp_planner");
  //     exit(1);
  //   }
  // }
  /*
   * all parameters are loaded
   */
  pubStartGoalMarkers();//red-start, blue-goal
  readyToPubPath = false;
  ROS_INFO("Done with publishing markers");

  ros::Rate r(1000);
  while(ros::ok()) 
  {
    if(readyToPubPath){
      pub_coefs.publish(plannerPath.buildCubicMsg());
      pubPath();
      readyToPubPath = false;
    }
    r.sleep();
    ros::spinOnce();
  }

  fflush(stdout);

  std::cout<<"\nExiting Normally\n";
  return 0;
}
