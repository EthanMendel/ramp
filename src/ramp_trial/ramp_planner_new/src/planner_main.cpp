#include "ros/ros.h"
#include "../include/planner.h"
#include <visualization_msgs/MarkerArray.h>
#include <ramp_planner_new/TrajectoryRepresentation.h>
#include <ramp_planner_new/TrajectoryRequest.h>
 
Utility utility;

int                 id;
MotionState         start, goal;
std::vector<MotionState> pathPoints;
Path                straightLinePath;
bool                readyToPubPath;
std::vector<Range>  ranges;
double              radius;
double              max_speed_linear;
double              max_speed_angular;
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
      start = point;
    }else if(i == points.size() -1){
      goal = point;
    }
    pathPoints.push_back(point);
    KnotPoint pkp(point);
    straightLinePath.msg_.points.push_back(pkp.buildKnotPointMsg());
  }
  // std::cout<<"points at init:\n"<<straightLinePath.buildPathMsg()<<std::endl;
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
    handle.getParam("robot_info/max_speed_linear", max_speed_linear);
  }else{
    ROS_ERROR("Did not find robot_info/max_speed_linear rosparam");
    exit(1);
  }
  
  // start and goal vectors
  if(handle.hasParam("robot_info/start") &&
      handle.hasParam("robot_info/goal")){
    std::vector<float> p_start;
    std::vector<float> p_goal;
    std::vector<float> p_waypoint;
    handle.getParam("robot_info/start", p_start);
    handle.getParam("robot_info/goal",  p_goal );
    handle.getParam("robot_info/waypoint", p_waypoint);
    initStartGoal({p_start, p_waypoint, p_goal});
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
    std::cout<<"\n  Start: "<<start.toString();
    std::cout<<"\n  Goal: "<<goal.toString();
    std::cout<<"\n  Ranges: ";
    for(uint8_t i=0;i<ranges.size();i++) {
      std::cout<<"\n  "<<i<<": "<<ranges.at(i).toString();
    }
  std::cout<<"\n---------------------------------------";
}

void pubStartGoalMarkers(RvizHandler pub_rviz){
  ROS_INFO("In pubStartGoalMarkers");
  visualization_msgs::MarkerArray result;

  // markers for both positions
  for(unsigned int i=0;i<pathPoints.size();i++){
    visualization_msgs::Marker marker;
    marker.header.stamp = ros::Time::now();
    if(i==0){
      marker.id = 10001;
    }else if(i == pathPoints.size() - 1){
      marker.id = 10000 + pathPoints.size();
    }else{
      marker.id = 10001 + i;
    }
    marker.header.frame_id = global_frame;
    marker.ns = "basic_shapes";
    marker.type = visualization_msgs::Marker::SPHERE;
    marker.action = visualization_msgs::Marker::ADD;
    // set positions
    marker.pose.position.x = pathPoints.at(i).msg_.positions[0];
    marker.pose.position.y = pathPoints.at(i).msg_.positions[1];
    marker.pose.position.z = 0.01;
    // set orientations
    marker.pose.orientation.x = 0.0;
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 1.0;
    // set radii
    marker.scale.x = 0.5;
    marker.scale.y = 0.5;
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
  origin_marker.pose.position.x = 0;
  origin_marker.pose.position.y = 0;
  origin_marker.pose.position.z = 0.01;
  origin_marker.pose.orientation.x = 0.0;
  origin_marker.pose.orientation.y = 0.0;
  origin_marker.pose.orientation.z = 0.0;
  origin_marker.pose.orientation.w = 1.0;
  origin_marker.scale.x = 0.5;
  origin_marker.scale.y = 0.5;
  origin_marker.scale.z = 0.1;
  origin_marker.color.r = 0;
  origin_marker.color.g = 1;
  origin_marker.color.b = 0;
  origin_marker.color.a = 1;
  origin_marker.lifetime = ros::Duration(120.0);
  result.markers.push_back(origin_marker);

  ROS_INFO("Waiting for rviz to start...");
  ros::Rate r(100);
  ros::Time tStart = ros::Time::now();
  ros::Duration dWait(10);
  while(pub_rviz.getNumSubscribers() == 0 && (ros::Time::now() - tStart) < dWait){
    ros::spinOnce();
    r.sleep();
  }
  if(pub_rviz.getNumSubscribers() == 0){
    ROS_WARN("Could not get subscriber for \"visualization_marker_array\"");
  }else{
    ROS_INFO("Rviz started");
  }

  pub_rviz.sendPathPoints(result);
  pub_rviz.sendPathPoints(result);
  
  ROS_INFO("Exiting pubStartGoalMarkers");
}

void pubPath(RvizHandler pub_rviz){
  ROS_INFO("In pubPath");
  visualization_msgs::MarkerArray result;
  while(straightLinePath.msg_.points.size()<=pathPoints.size()){
    ros::spinOnce();
  }

  for(unsigned int i=0;i<straightLinePath.msg_.points.size()-1;i++) {
    // markers for both positions
    visualization_msgs::Marker mp_marker;

    mp_marker.header.stamp = ros::Time::now();
    mp_marker.id = 20000 + i;

    mp_marker.header.frame_id = global_frame;

    mp_marker.ns = "points_and_lines";

    mp_marker.type = visualization_msgs::Marker::LINE_STRIP;

    mp_marker.action = visualization_msgs::Marker::ADD;
    
    // first point to create line
    geometry_msgs::Point first;
    first.x = straightLinePath.msg_.points[i].motionState.positions[0];
    first.y = straightLinePath.msg_.points[i].motionState.positions[1];
    first.z = 0.01;
    mp_marker.points.push_back(first);

    // set next point to create line
    geometry_msgs::Point next;
    next.x = straightLinePath.msg_.points[i+1].motionState.positions[0];
    next.y = straightLinePath.msg_.points[i+1].motionState.positions[1];
    next.z = 0.01;
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
    mp_marker.scale.z = 0.02;
  
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

  ROS_INFO("Waiting for rviz to start...");
  ros::Rate r(100);
  ros::Time tStart = ros::Time::now();
  ros::Duration dWait(10);
  while(pub_rviz.getNumSubscribers() == 0 && (ros::Time::now() - tStart) < dWait){
    ros::spinOnce();
    r.sleep();
  }
  if(pub_rviz.getNumSubscribers() == 0){
    ROS_WARN("Could not get subscriber for \"visualization_marker_array\"");
  }else{
    ROS_INFO("Rviz started");
  }

  pub_rviz.sendMarkerArray(result);
  pub_rviz.sendMarkerArray(result);
  
  ROS_INFO("Exiting pubPath");
}

void getTrajectory(ramp_planner_new::TrajectoryRequest msg){
  std::cout<<"getting trajectory.."<<std::endl;
  if(msg.type == "cubic"){
      straightLinePath.makeCubicPath(msg.timeNeeded);
  }else{
      straightLinePath.makeBezierPath(msg.timeNeeded);
  }
  readyToPubPath = true;
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
  ROS_INFO("Done loading rosparams");
  
  RvizHandler pub_rviz(handle);
  
  ros::Duration d(0.5);
  d.sleep();
  /*
   * check that the start and goal are within specified ranges
   */
  for(int i=0;i<ranges.size();i++){
    if( start.msg_.positions[i] < ranges[i].msg_.min || start.msg_.positions[i] > ranges[i].msg_.max ||
        goal.msg_.positions[i] < ranges[i].msg_.min || goal.msg_.positions[i] > ranges[i].msg_.max ){
      ROS_ERROR("Either the Start or goal position is not within DOF ranges, exiting ramp_planner");
      exit(1);
    }
  }
  /*
   * all parameters are loaded
   */
  pubStartGoalMarkers(pub_rviz);//red-start, blue-goal
  // handle.subscribe("/time_needed", 1, getTrajectory);
  readyToPubPath = false;
  ramp_planner_new::TrajectoryRequest msg;
  msg.timeNeeded = 5;
  msg.type = "cubic";
  getTrajectory(msg);
  ROS_INFO("Done with publishing markers");

  ros::Rate r(1000);
  while(ros::ok()) 
  {
    if(readyToPubPath){
      pub_rviz.sendCoefs(straightLinePath.buildCubicMsg());
      pubPath(pub_rviz);
      readyToPubPath = false;
    }
    r.sleep();
    ros::spinOnce();
  }

  fflush(stdout);

  std::cout<<"\nExiting Normally\n";
  return 0;
}
