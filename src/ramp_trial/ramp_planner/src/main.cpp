#include "ros/ros.h"
#include "planner.h"
#include <visualization_msgs/MarkerArray.h>
 

Utility utility;


int                 id;
MotionState         start, goal;
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
ros::Publisher pub_rviz;

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
  
  // evaluation weights
  handle.getParam("/ramp/eval_weight_T", T_weight);
  handle.getParam("/ramp/eval_weight_D", D_weight);
  handle.getParam("/ramp/eval_weight_A", A_weight);

  if(handle.hasParam("robot_info/max_speed_angular")){
    handle.getParam("robot_info/max_speed_angular", max_speed_angular);
  }else{
    ROS_ERROR("Did not find robot_info/max_speed_angular rosparam");
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
  
  if(handle.hasParam("ramp/evaluations")) {
    handle.getParam("ramp/evaluations", evaluations);
    std::cout<<"\nevaluations: "<<evaluations;
  }
  
  if(handle.hasParam("ramp/seed_population")) {
    handle.getParam("ramp/seed_population", seedPopulation);
    std::cout<<"\nseed_population: "<<seedPopulation;
  }
  
  if(handle.hasParam("ramp/only_sensing")){
    handle.getParam("ramp/only_sensing", only_sensing);
    std::cout<<"\nonly_sensing: "<<only_sensing;
  }

  if(handle.hasParam("ramp/moving_robot")){
    handle.getParam("ramp/moving_robot", moving_robot);
    std::cout<<"\nmoving_robot: "<<moving_robot;
  }

  if(handle.hasParam("ramp/preplanning_cycles")){
    handle.getParam("ramp/preplanning_cycles", num_ppcs);
    std::cout<<"\npreplanning_cycles: "<<num_ppcs;
  }
  
  if(handle.hasParam("ramp/stop_after_ppcs")){
    handle.getParam("ramp/stop_after_ppcs", stop_after_ppcs);
    std::cout<<"\nstop_after_ppcs: "<<stop_after_ppcs ? "True" : "False";
  }

  if(handle.hasParam("ramp/sensing_before_control_cycle")){
    handle.getParam("ramp/sensing_before_control_cycle", sensingBeforeCC);
    ROS_INFO("sensingBeforeCC: %s", sensingBeforeCC ? "True" : "False");
  }
  
  if(handle.hasParam("ramp/fixed_control_cycle_rate")) {
    handle.getParam("ramp/fixed_control_cycle_rate", t_cc_rate);
  }
  
  if(handle.hasParam("ramp/sensing_cycle_rate")) {
    handle.getParam("ramp/sensing_cycle_rate", t_sc_rate);
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
  


  if(handle.hasParam("ramp/error_reduction")) {
    handle.getParam("ramp/error_reduction", errorReduction);
  }


  if(handle.hasParam("ramp/try_ic_loop")) {
    handle.getParam("ramp/try_ic_loop", try_ic_loop);
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



void pubStartGoalMarkers(){
  ROS_INFO("In pubStartGoalMarkers");
  visualization_msgs::MarkerArray result;

  // markers for both positions
  visualization_msgs::Marker start_marker, goal_marker;

  start_marker.header.stamp = ros::Time::now();
  goal_marker.header.stamp = ros::Time::now();
  start_marker.id = 10000;
  goal_marker.id = 10001;

  start_marker.header.frame_id = global_frame;
  goal_marker.header.frame_id = global_frame;

  start_marker.ns = "basic_shapes";
  goal_marker.ns = "basic_shapes";

  start_marker.type = visualization_msgs::Marker::SPHERE;
  goal_marker.type = visualization_msgs::Marker::SPHERE;

  start_marker.action = visualization_msgs::Marker::ADD;
  goal_marker.action = visualization_msgs::Marker::ADD;
  
  // set positions
  start_marker.pose.position.x = start.msg_.positions[0];
  start_marker.pose.position.y = start.msg_.positions[1];
  start_marker.pose.position.z = 0.01;
  
  goal_marker.pose.position.x = goal.msg_.positions[0];
  goal_marker.pose.position.y = goal.msg_.positions[1];
  goal_marker.pose.position.z = 0.01;

  // set orientations
  start_marker.pose.orientation.x = 0.0;
  start_marker.pose.orientation.y = 0.0;
  start_marker.pose.orientation.z = 0.0;
  start_marker.pose.orientation.w = 1.0;
 
  goal_marker.pose.orientation.x = 0.0;
  goal_marker.pose.orientation.y = 0.0;
  goal_marker.pose.orientation.z = 0.0;
  goal_marker.pose.orientation.w = 1.0;

  // set radii
  start_marker.scale.x = 0.5;
  start_marker.scale.y = 0.5;
  start_marker.scale.z = 0.1;
 
  goal_marker.scale.x = 0.5;
  goal_marker.scale.y = 0.5;
  goal_marker.scale.z = 0.1;

  // set colors
  start_marker.color.r = 1;
  start_marker.color.g = 0;
  start_marker.color.b = 0;
  start_marker.color.a = 1;
 
  goal_marker.color.r = 0;
  goal_marker.color.g = 0;
  goal_marker.color.b = 1;
  goal_marker.color.a = 1;

  // set lifetimes
  start_marker.lifetime = ros::Duration(120.0);
  goal_marker.lifetime = ros::Duration(120.0);

  // create marker array and publish
  result.markers.push_back(start_marker);
  result.markers.push_back(goal_marker);

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

  pub_rviz.publish(result);
  pub_rviz.publish(result);
  
  ROS_INFO("Exiting pubStartGoalMarkers");
}



int main(int argc, char** argv) {
  srand( time(0));

  ros::init(argc, argv, "ramp_planner");
  ros::NodeHandle handle;

  ros::param::set("ramp/cc_started", false);
  std::cout<<"\nHandle namespace: "<<handle.getNamespace();
  
  // load ros parameters
  loadParameters(handle);
  ROS_INFO("Done loading rosparams");

  Planner my_planner; 
  
  // use updateCallbackPose if the msg type is PoseWithCovarianceStamped
  if(update_topic != "odom"){
    ros::Subscriber sub_updatePose_ = handle.subscribe(update_topic, 1, &Planner::updateCbPose, &my_planner);
  }
  ros::Subscriber sub_updateVel_  = handle.subscribe("update", 1, &Planner::updateCbControlNode, &my_planner);
  ros::Subscriber sub_sc_         = handle.subscribe("obstacles", 1, &Planner::sensingCycleCallback, &my_planner);
  ros::Subscriber sub_hmap        = handle.subscribe("hilbert_map_grid", 1, &Planner::hilbertMapObsCb, &my_planner);
  ros::Subscriber sub_combined    = handle.subscribe("combined_map", 1, &Planner::combinedMapCb, &my_planner);
  ROS_INFO("Done initializing Subscribers");

  pub_rviz = handle.advertise<visualization_msgs::MarkerArray>("visualization_marker_array", 10);

  // sleep to wait for tf data
  ros::Duration d(0.5);
  d.sleep();
  ROS_INFO("Done sleeping");

  // wait for Transform from map to the planner's global_frame
  if(global_frame != "map"){
    ROS_INFO("Waiting to get tf from map to global_frame");
    tf::TransformListener listener_;
    if(listener_.waitForTransform(global_frame, "map", ros::Time(0), d)){
      listener_.lookupTransform(global_frame, "map", ros::Time(0), my_planner.tf_global_costmap_);
    }
    else{ }
  }
  d.sleep();

  /*
   * get the transform from odom to global frame
   */
  tf::TransformListener listen;
  listen.waitForTransform(global_frame, "odom", ros::Time(0), ros::Duration(2.0));
  listen.lookupTransform(global_frame, "odom", ros::Time(0), my_planner.tf_global_odom_);
  ROS_INFO("Odom tf: translate: (%f, %f) rotation: %f", my_planner.tf_global_odom_.getOrigin().getX(), my_planner.tf_global_odom_.getOrigin().getX(), my_planner.tf_global_odom_.getRotation().getAngle());
  
  my_planner.tf_global_odom_rot_ = my_planner.tf_global_odom_;
  my_planner.tf_global_odom_rot_.setOrigin( tf::Vector3(0, 0, 0) );
  
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
  // initialize planner
  my_planner.init(id, handle, start, goal, ranges, max_speed_linear, max_speed_angular, population_size, radius, sub_populations, global_frame, update_topic, pt, num_ppcs, stop_after_ppcs, sensingBeforeCC, t_sc_rate, t_cc_rate, only_sensing, moving_robot, errorReduction, try_ic_loop, T_weight, A_weight, D_weight, show_full_traj);
  my_planner.modifications_   = modifications;
  my_planner.evaluations_     = evaluations;
  my_planner.seedPopulation_  = seedPopulation;

  ROS_INFO("Planner object initialized");

  std::cout<<"\nStart: "<<my_planner.start_.toString();
  std::cout<<"\nGoal: "<<my_planner.goal_.toString();

  pubStartGoalMarkers();
  ROS_INFO("Done with pubStartGoalMarkers");
 
  ros::Rate r(20);
  /*
   * wait for sensing module to be ready
   */
  ROS_INFO("Planner is waiting for sensing module to be ready");
  bool sensingReady = false;
  while(sensingReady == false && ros::ok()){
    handle.param("/ramp/sensing_ready", sensingReady, false);
    ros::spinOnce();
    r.sleep();
  }
  ROS_INFO("Sensing module is ready!");

  if(use_hilbert_map){
    ROS_INFO("Waiting to get hilbert map obstacles on topic /hmap_obstacles");
    // wait until we get the hilbert map
    while(!my_planner.evalHMap_ && ros::ok()){
      ros::spinOnce();
      r.sleep();
    }
    ROS_INFO("Got hilbert map!");
  }else{
    ROS_INFO("Not using hilbert map, starting planner");
  }
  /******* Start the planner *******/
  if(use_start_param){
    start_planner = false;
    handle.setParam("ramp/start_planner", false);
    ROS_INFO("Waiting for param ramp/start_planner to be true");
    while(!start_planner){
      handle.param("ramp/start_planner", start_planner, false);
    }
  }else{
    ROS_INFO("Press Enter to start the planner");
    std::cin.get(); 
  }
  ROS_INFO("Starting Planner!");
 
  my_planner.go();
  
  printf("\n\nExiting Normally\n");
  ros::shutdown();
  return 0;
}
