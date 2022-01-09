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
double max_speed_linear = 0.33;

// j should be the index of the goal marker within pathPoints
bool needBezify(const unsigned int j){
    //type indexes are based on start index
    if(j > 0 and j < pathPoints.types.size()){
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
    unsigned int j=0;//j used as iterator for types, as types.size() = markers.size()-1
    for(int i=0;i<pathPoints.markers.size();i++){
        if(pathPoints.markers.at(i).id == curStartId){//find the current start marker based on id
            if(!pathPoints.forBez.at(i)){//if the current start is only for bezier calculation
                curStartId += 1;//skip it
                continue;
            }
            if(i < pathPoints.markers.size() - 1){//make sure there there is a next point (as a goal)
                if(needBezify(j + 1)){//need bezify checks to make sure we can do i+2
                    //if we need to bezify the path, send bezify request
                    ramp_planner_new::BezifyRequest br;
                    br.pathPoints = pathPoints;
                    br.markers.push_back(pathPoints.markers.at(i));
                    br.markers.push_back(pathPoints.markers.at(i+1));
                    br.markers.push_back(pathPoints.markers.at(i+2));
                    pub_bezify_request.publish(br);
                }else{//else, no bezify needed
                    curStartGoal.markers.push_back(pathPoints.markers.at(i));
                    curStartGoal.markers.push_back(pathPoints.markers.at(i+1));
                    ramp_planner_new::TrajectoryRequest msg;
                    if(pathPoints.types.at(j) == "cubic"){
                        msg.type = "cubic";
                        msg.points.push_back(pathPoints.markers.at(i).pose.position);
                        if(!pathPoints.forBez.at(i + 1)){
                            std::cout<<"a forBez point found as goal in cubic request..\nstoping process"<<std::endl;
                            break;
                        }
                        msg.points.push_back(pathPoints.markers.at(i + 1).pose.position);
                        if((i-1) >= 0 && !pathPoints.forBez.at(i-1)){
                            std::cout<<"found a forBez point before start point"<<std::endl;//this means we need to calculate entrence velocities for cubic entrence
                            msg.points.push_back(pathPoints.markers.at(i-1).pose.position);
                        }
                        if(pathPoints.markers.size() > (i + 2) && !pathPoints.forBez.at(i+2)){
                            std::cout<<"found a forBez point after goal point"<<std::endl;//this means we need to save exit velocities for bezier entrence
                            msg.points.push_back(pathPoints.markers.at(i + 2).pose.position);
                        }else{
                            std::cout<<"markers not long enough, or no forBez after goal"<<std::endl;
                        }
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
            }else{
                std::cout<<"no next point, end of trajectory"<<std::endl;
            }
            break;
        }
        j++;
    }
}

void pathPointsCallback(const ramp_planner_new::PathPoints pp){
    std::cout<<"---got "<<pp.markers.size()<<" path points in buffer---"<<std::endl;
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

  ros::Subscriber pathPointsListener  = handle.subscribe("/path_points_channel", 1, pathPointsCallback);
  ros::Subscriber readyNextListener = handle.subscribe("/ready_next", 1, getNextPoint);
  pub_path_points = handle.advertise<visualization_msgs::MarkerArray>("/start_goal_channel",10);
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
