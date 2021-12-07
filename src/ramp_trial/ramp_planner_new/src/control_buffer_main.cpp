#include "ros/ros.h"
#include "visualization_msgs/MarkerArray.h"
#include <std_msgs/Bool.h>
#include <geometry_msgs/Pose.h>
#include <ramp_planner_new/TrajectoryRequest.h>
#include <ramp_planner_new/PathPoints.h>
#include <ramp_planner_new/BezifyRequest.h>

ramp_planner_new::PathPoints pathPoints;
int curStartId = -1;
visualization_msgs::MarkerArray curStartGoal;
ros::Publisher pub_path_points;
ros::Publisher pub_time_needed;
ros::Publisher pub_bezify_request;
double max_linear_vel = 0.33;

//assuming straight line path from start to goal
double getMinLinTime(const geometry_msgs::Point& start, const geometry_msgs::Point goal){
  double sx = start.x;
  double sy = start.y;
  double gx = goal.x;
  double gy = goal.y;

  double dist = sqrt(pow(sx-gx,2)+pow(sy-gy,2));
  return ceil(dist/max_linear_vel);
}

// j should be the index of the goal marker within pathPoints
bool needBezify(const unsigned int j){
    //type indexes are based on start index
    if(j > 0 and j < pathPoints.markers.size() - 1){
        //return whether both types involving the inputed point are cubic (linear)
        if(pathPoints.types.at(j-1) == "cubic" && pathPoints.types.at(j) == "cubic"){
            std::cout<<"two cubics side by side"<<std::endl;
            return true;
        }else if(pathPoints.types.at(j-1) == "uCubic" && pathPoints.types.at(j) == "uCubic"){
            std::cout<<"foud a u trajectory, something went wrong"<<std::endl;
            return NULL;
        }
        else{
            std::cout<<"cubic and bezier side by side"<<std::endl;
            return false;
        }
    }else{
        std::cout<<"at begining or end of path"<<std::endl;
        return false;
    }
}

void updateStartGoal(){
    curStartGoal.markers.clear();
    // std::cout<<"pathPoints\n\t"<<
    //     pathPoints.markers.size()<<" markers\n\t"<<
    //     pathPoints.points.size()<<" points\n\t"<<
    //     pathPoints.forBez.size()<<" bez points\n\t"<<
    //     pathPoints.types.size()<<" segments"<<std::endl;
    unsigned int j=0;
    for(unsigned int i=0;i<pathPoints.markers.size();i++){
        if(pathPoints.markers.at(i).id == curStartId){
            if(!pathPoints.forBez.at(i)){
                curStartId += 1;
                continue;
            }
            if(i < pathPoints.markers.size() - 1){
                if(needBezify(i + 1)){//need bezify checks to make sure we can do i+2
                    ramp_planner_new::BezifyRequest br;
                    br.pathPoints = pathPoints;
                    br.markers.push_back(pathPoints.markers.at(i));
                    br.markers.push_back(pathPoints.markers.at(i+1));
                    br.markers.push_back(pathPoints.markers.at(i+2));
                    br.timeNeeded = getMinLinTime(pathPoints.markers.at(i).pose.position,pathPoints.markers.at(i+2).pose.position);
                    pub_bezify_request.publish(br);
                    // bezify(br);
                    // updateStartGoal();
                }else{
                    curStartGoal.markers.push_back(pathPoints.markers.at(i));
                    curStartGoal.markers.push_back(pathPoints.markers.at(i+1));
                    ramp_planner_new::TrajectoryRequest msg;
                    if(pathPoints.types.at(j) == "cubic"){
                        msg.timeNeeded = getMinLinTime(pathPoints.markers.at(i).pose.position,pathPoints.markers.at(i+1).pose.position);
                        msg.type = "cubic";
                        msg.points.push_back(pathPoints.markers.at(i).pose.position);
                        if(!pathPoints.forBez.at(i + 1)){
                            std::cout<<"a forBez point found in cubic request..\nstoping process"<<std::endl;
                            break;
                        }
                        msg.points.push_back(pathPoints.markers.at(i + 1).pose.position);
                    }else if (pathPoints.types.at(j) == "bezier"){
                        msg.type = "bezier";
                        msg.points.push_back(pathPoints.markers.at(i).pose.position);
                        if(pathPoints.forBez.at(i + 1)){
                            std::cout<<"a non forBez point found as p1..\nstoping process"<<std::endl;
                            break;
                        }
                        msg.points.push_back(pathPoints.markers.at(i + 1).pose.position);
                        if(i + 2 >= pathPoints.markers.size()){
                            std::cout<<"not enough points for bezier request..\nstopping preocess"<<std::endl;
                            break;
                        }
                        msg.timeNeeded = getMinLinTime(pathPoints.markers.at(i).pose.position,pathPoints.markers.at(i+2).pose.position);
                        if(!pathPoints.forBez.at(i + 2)){
                            std::cout<<"a forBez point found as p2..\nstoping process"<<std::endl;
                            break;
                        }
                        msg.points.push_back(pathPoints.markers.at(i + 2).pose.position);
                    }else{
                        std::cout<<"foud a u trajectory, something went wrong"<<std::endl;
                    }
                    
                    std::cout<<"sending trajectory request"<<std::endl;
                    // std::cout<<msg<<std::endl;
                    pub_time_needed.publish(msg);
                }
            }
            break;
        }
        j++;
    }
}

void pathPointsCallback(const ramp_planner_new::PathPoints pp){
    std::cout<<"---got path points in buffer---"<<std::endl;
    pathPoints = pp;
    if(curStartId == -1){
        curStartId = pp.markers.at(0).id;
    }
    updateStartGoal();
}

void getNextPoint(const std_msgs::Bool b){
    curStartId += 1;
    updateStartGoal();
}

int main(int argc, char** argv) {
  std::cout<<"\nstarting listener\n";
  srand( time(0));

  ros::init(argc, argv, "ramp_control_buffer");
  ros::NodeHandle handle;
//   ros::NodeHandle handle_local("~");

  ros::Subscriber pathPointsListener  = handle.subscribe("path_points_channel", 1, pathPointsCallback);
  ros::Subscriber readyNextListener = handle.subscribe("ready_next", 1, getNextPoint);
  pub_path_points = handle.advertise<visualization_msgs::MarkerArray>("start_goal_channel",10);
  pub_time_needed = handle.advertise<ramp_planner_new::TrajectoryRequest>("/traj_req",1);
  pub_bezify_request = handle.advertise<ramp_planner_new::BezifyRequest>("/bezify_request",1);
  setvbuf(stdout, NULL, _IOLBF, 4096);

  ros::Rate r(1000);
  while(ros::ok()) 
  {
    r.sleep();
    ros::spinOnce();
  }

  fflush(stdout);

  std::cout<<"\nExiting Normally\n";
  return 0;
}
