#include "ros/ros.h"
#include "../include/planner.h"
#include <visualization_msgs/MarkerArray.h>
 
Utility utility;

int                 id;
MotionState         start, goal;
Path                straightLinePath;
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
void initStartGoal(const std::vector<float> s, const std::vector<float> g) {
  for(unsigned int i=0;i<s.size();i++) {
    start.msg_.positions.push_back(s.at(i));
    goal.msg_.positions.push_back(g.at(i));

    start.msg_.velocities.push_back(0);
    goal.msg_.velocities.push_back(0);

    start.msg_.accelerations.push_back(0);
    goal.msg_.accelerations.push_back(0);

    start.msg_.jerks.push_back(0);
    goal.msg_.jerks.push_back(0);
  }
  KnotPoint skp(start);
  KnotPoint gkp(goal);
  straightLinePath.msg_.points.push_back(skp.buildKnotPointMsg());
  straightLinePath.msg_.points.push_back(gkp.buildKnotPointMsg());
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
    handle.getParam("robot_info/start", p_start);
    handle.getParam("robot_info/goal",  p_goal );
    initStartGoal(p_start, p_goal);
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
  visualization_msgs::Marker start_marker, goal_marker,origin_marker;

  start_marker.header.stamp = ros::Time::now();
  goal_marker.header.stamp = ros::Time::now();
  start_marker.id = 10000;
  goal_marker.id = 10001;
  origin_marker.id = 10002;

  start_marker.header.frame_id = global_frame;
  goal_marker.header.frame_id = global_frame;
  origin_marker.header.frame_id = global_frame;

  start_marker.ns = "basic_shapes";
  goal_marker.ns = "basic_shapes";
  origin_marker.ns = "basic_shapes";

  start_marker.type = visualization_msgs::Marker::SPHERE;
  goal_marker.type = visualization_msgs::Marker::SPHERE;
  origin_marker.type = visualization_msgs::Marker::SPHERE;

  start_marker.action = visualization_msgs::Marker::ADD;
  goal_marker.action = visualization_msgs::Marker::ADD;
  origin_marker.action = visualization_msgs::Marker::ADD;
  
  // set positions
  start_marker.pose.position.x = start.msg_.positions[0];
  start_marker.pose.position.y = start.msg_.positions[1];
  start_marker.pose.position.z = 0.01;
  
  goal_marker.pose.position.x = goal.msg_.positions[0];
  goal_marker.pose.position.y = goal.msg_.positions[1];
  goal_marker.pose.position.z = 0.01;

  origin_marker.pose.position.x = 0;
  origin_marker.pose.position.y = 0;
  origin_marker.pose.position.z = 0.01;


  // set orientations
  start_marker.pose.orientation.x = 0.0;
  start_marker.pose.orientation.y = 0.0;
  start_marker.pose.orientation.z = 0.0;
  start_marker.pose.orientation.w = 1.0;
 
  goal_marker.pose.orientation.x = 0.0;
  goal_marker.pose.orientation.y = 0.0;
  goal_marker.pose.orientation.z = 0.0;
  goal_marker.pose.orientation.w = 1.0;

  origin_marker.pose.orientation.x = 0.0;
  origin_marker.pose.orientation.y = 0.0;
  origin_marker.pose.orientation.z = 0.0;
  origin_marker.pose.orientation.w = 1.0;


  // set radii
  start_marker.scale.x = 0.5;
  start_marker.scale.y = 0.5;
  start_marker.scale.z = 0.1;
 
  goal_marker.scale.x = 0.5;
  goal_marker.scale.y = 0.5;
  goal_marker.scale.z = 0.1;

  origin_marker.scale.x = 0.5;
  origin_marker.scale.y = 0.5;
  origin_marker.scale.z = 0.1;

  // set colors
  start_marker.color.r = 1;
  start_marker.color.g = 0;
  start_marker.color.b = 0;
  start_marker.color.a = 1;
 
  goal_marker.color.r = 0;
  goal_marker.color.g = 0;
  goal_marker.color.b = 1;
  goal_marker.color.a = 1;

  origin_marker.color.r = 0;
  origin_marker.color.g = 1;
  origin_marker.color.b = 0;
  origin_marker.color.a = 1;

  // set lifetimes
  start_marker.lifetime = ros::Duration(120.0);
  goal_marker.lifetime = ros::Duration(120.0);
  origin_marker.lifetime = ros::Duration(120.0);

  // create marker array and publish
  result.markers.push_back(start_marker);
  result.markers.push_back(goal_marker);
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

  pub_rviz.sendMarkerArray(result);
  pub_rviz.sendMarkerArray(result);
  
  ROS_INFO("Exiting pubStartGoalMarkers");
}

void pubPath(RvizHandler pub_rviz){
  ROS_INFO("In pubPath");
  pub_rviz.sendPath(straightLinePath.buildPathMsg());
    visualization_msgs::MarkerArray result;

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

      std::cout<<"segment "<<i+1<<" from ("<<first.x<<", "<<first.y<<", "<<first.z<<
      ") to ("<<next.x<<", "<<next.y<<", "<<next.z<<")"<<std::endl;
      
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

  pub_rviz.sendTrajectory(result);
  pub_rviz.sendTrajectory(result);
  
  ROS_INFO("Exiting pubPath");
}

void trajCallback(const ramp_msgs::Path path){
  std::cout<<"got path in trajCallback"<<std::endl;
  //proably shouldnt be sending all at one time?
  //how to determin when to send the next one?
  for(unsigned int i=0;i<path.points.size();i++){
    geometry_msgs::Twist t;
    t.linear.x = path.points.at(i).motionState.velocities.at(0);
    t.linear.y = path.points.at(i).motionState.velocities.at(1);
    t.linear.z = 0;
    t.angular.x = 0;
    t.angular.y = 0;
    t.angular.z = 0;

    // pub_rviz.sendTwist(t);
    //publish to the robot somehow
  }
  std::cout<<"all twists sent"<<std::endl;
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
  ros::Subscriber trajListener  = handle.subscribe("trajChannel", 1, trajCallback);
  pubStartGoalMarkers(pub_rviz);//red-start, blue-goal
  // straightLinePath.makeStraightPath();
  straightLinePath.makeCubicPath(10);
  pubPath(pub_rviz);
  ROS_INFO("Done with pubStartGoalMarkers");
 
  ros::Rate r(20);
  ros::spin();
  r.sleep();

  printf("\n\nExiting Normally\n");
  ros::shutdown();
  return 0;
}
