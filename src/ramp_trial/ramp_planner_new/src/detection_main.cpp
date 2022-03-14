#include "ros/ros.h"
#include "../include/planner.h"
#include <visualization_msgs/MarkerArray.h>
#include <ramp_planner_new/TrajectoryRepresentation.h>
#include <ramp_planner_new/TrajectoryRequest.h>
#include <ramp_planner_new/BezifyRequest.h>
#include <ramp_planner_new/TrajectorySwap.h>

std::vector<MotionState> pathMotionStates;
Path                plannerPath;
std::string         global_frame;


// initializes global start and goal
void initStartGoal(const std::vector<std::vector<float>> points) {
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
    
  std::cout<<"\n------- Done loading parameters -------";
  std::cout<<"\n---------------------------------------\n";
}

void pubStartGoalMarkers(bool publish = true){
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
  if(publish){
    // rviz_pub_path_points.publish(result);
    // rviz_pub_path_points.publish(result);
    // pub_path_points.publish(pps);
    // pub_path_points.publish(pps);
  }
  
  ROS_INFO("Exiting pubStartGoalMarkers");
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
  

  ros::Duration d(0.5);
  d.sleep();
  pubStartGoalMarkers(true);//red-start, blue-goal
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
