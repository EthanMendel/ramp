#include "ros/ros.h"
#include "../include/planner.h"
#include <visualization_msgs/MarkerArray.h>
#include <ramp_planner_new/TrajectoryRepresentation.h>
#include <ramp_planner_new/TrajectoryRequest.h>
#include <ramp_planner_new/BezifyRequest.h>
#include <ramp_planner_new/TrajectorySwap.h>
#include <ramp_planner_new/Population.h>
#include <string>

std::vector<std::vector<MotionState>> paths;
std::vector<Path>                plannerPaths;
std::string         global_frame;
ros::Publisher      pub_path_points;
ros::Publisher      rviz_pub_path_points;
ros::Publisher      pub_markerArray;
ramp_planner_new::Population pathPop;


// initializes global start and goal
void initStartGoal(const std::vector<std::vector<float>> points) {
  double pastY;
  std::vector<MotionState> path;
  Path plannerPath;
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
        std::cout<<"\t**consecutive y values.. adding .00001 to subsequent one\tin detector"<<std::endl;
      }
      pastY = point.msg_.positions.at(1);
    }
    path.push_back(point);
    KnotPoint pkp(point);
    plannerPath.msg_.points.push_back(pkp.buildKnotPointMsg());
  }
  paths.push_back(path);
  plannerPaths.push_back(plannerPath);
  // std::cout<<"points at init:\n"<<plannerPath.buildPathMsg()<<std::endl;
}

 /** loads all ros parameters from .yaml 
 *  Calls initDOF, initStartGoal */
void loadParameters(const ros::NodeHandle handle){
  std::cout<<"\nLoading parameters\n";
  std::cout<<"\nHandle NS: "<<handle.getNamespace()<<std::endl;

    if(handle.hasParam("ramp/global_frame")){
      handle.getParam("ramp/global_frame", global_frame);
    }

  int i=4;
  while(handle.hasParam("robot_info/path"+std::to_string(i)+"start")){
    // std::cout<<"checking path "<<i<<std::endl;
    std::vector<std::vector<float>> path;
    std::vector<float> s;
    handle.getParam("robot_info/path"+std::to_string(i)+"start",s);
    path.push_back(s);
    int j = 1;
    while(handle.hasParam("robot_info/path"+std::to_string(i)+"waypoint"+std::to_string(j))){
      // std::cout<<"\tchecking waypoint "<<j<<std::endl;
      std::vector<float> w;
      handle.getParam("robot_info/path"+std::to_string(i)+"waypoint"+std::to_string(j), w);
      path.push_back(w);
      j++;
    }
    std::vector<float> g;
    handle.getParam("robot_info/path"+std::to_string(i)+"goal",g);
    path.push_back(g);
    std::cout<<"==path "<<i<<" has "<<path.size()<<" points=="<<std::endl;
    initStartGoal(path);
    i--;
  }
  std::cout<<"\nthere are "<<paths.size()<<" paths loaded"<<std::endl;
    
  std::cout<<"\n------- Done loading parameters -------";
  std::cout<<"\n---------------------------------------\n";
}

void pubStartGoalMarkers(bool publish = true){
  ROS_INFO("In pubStartGoalMarkers");
  std::vector<visualization_msgs::MarkerArray> results;

  // markers for both positions
  for(unsigned int p=0;p<paths.size();p++){
    std::vector<MotionState> pathMotionStates = paths.at(p);
    visualization_msgs::MarkerArray result;
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
    ramp_planner_new::PathPoints pps;
    pps.markers = result.markers;
    for(unsigned int i=0;i<result.markers.size()-1;i++){//populate type and forBez arrays
      pps.types.push_back("cubic");
      pps.forBez.push_back(true);
    }
    pps.forBez.push_back(true);//extra value needed not included above

    results.push_back(result);
    pathPop.paths.push_back(pps);
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

  results.at(0).markers.push_back(origin_marker); // add origin onto rviz path points
  std::cout<<"publishing "<<pathPop.paths.size()<<" paths"<<std::endl;
  pub_path_points.publish(pathPop);
  pub_path_points.publish(pathPop);
  for(unsigned int i=0;i<results.size();i++){
    rviz_pub_path_points.publish(results.at(i));
    rviz_pub_path_points.publish(results.at(i));
  }
  
  ROS_INFO("Exiting pubStartGoalMarkers");
}

void pubPath(){
  // ROS_INFO("In pubPath");
  visualization_msgs::MarkerArray result;

  for(unsigned int p=0;p<plannerPaths.size();p++){
    Path plannerPath = plannerPaths.at(p);
    for(unsigned int i=0;i<plannerPath.msg_.points.size()-1;i++) {
      // std::cout<<plannerPath.msg_.points.at(i).motionState.positions.at(0)<<"\t"<<plannerPath.msg_.points.at(i).motionState.positions.at(1)<<"->";
      // std::cout<<plannerPath.msg_.points.at(i+1).motionState.positions.at(0)<<"\t"<<plannerPath.msg_.points.at(i+1).motionState.positions.at(1)<<std::endl;
      // markers for both positions
      visualization_msgs::Marker mp_marker;

      mp_marker.header.stamp = ros::Time::now();
      mp_marker.id = ((p+1)*100000) + 20000 + i;

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
      next.z = -0.1;
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
      mp_marker.color.r = 0;
      mp_marker.color.g = 0;
      mp_marker.color.b = 0;
      mp_marker.color.a = 1;

      // set lifetimes
      mp_marker.lifetime = ros::Duration(120.0);

      // create marker array and publish
      result.markers.push_back(mp_marker);
    }
  }
  
  pub_markerArray.publish(result);
  pub_markerArray.publish(result);
  
  // ROS_INFO("Exiting pubPath");
}

int main(int argc, char** argv) {
  std::cout<<"\nstarting detector\n";
  srand( time(0));

  ros::init(argc, argv, "ramp_detection");
  ros::NodeHandle handle;

  ros::param::set("ramp/cc_started", false);
  std::cout<<"\nHandle namespace: "<<handle.getNamespace();
  
  // load ros parameters
  loadParameters(handle);
  ROS_INFO("Done loading rosparams");
  
  pub_path_points = handle.advertise<ramp_planner_new::Population>("path_points_channel",1);
  rviz_pub_path_points = handle.advertise<visualization_msgs::MarkerArray>("rviz_path_points",10);
  pub_markerArray = handle.advertise<visualization_msgs::MarkerArray>("visualization_marker_array", 10);

  ros::Duration d(0.5);
  d.sleep();
  pubStartGoalMarkers(true);//red-start, blue-goal
  pubPath();
  ROS_INFO("Done with publishing markers");

  ros::Rate r(1000);
  while(ros::ok()) 
  {
    r.sleep();
    ros::spinOnce();
  }

  fflush(stdout);

  std::cout<<"\nExiting Detector Normally\n";
  return 0;
}
