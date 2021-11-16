#include "ros/ros.h"
#include "visualization_msgs/MarkerArray.h"
#include <std_msgs/Bool.h>
#include <geometry_msgs/Pose.h>
#include <ramp_planner_new/TrajectoryRequest.h>

visualization_msgs::MarkerArray pathPoints;
int curStartId = -1;
visualization_msgs::MarkerArray curStartGoal;
ros::Publisher pub_path_points;
ros::Publisher pub_time_needed;
double max_linear_vel = 0.33;
double max_angular_vel = 1.5708;

//assuming straight line path from start to goal
void getMinLinTime(const visualization_msgs::MarkerArray& ma){
  geometry_msgs::Pose start;
  geometry_msgs::Pose goal;
  for(unsigned int i=0;i<ma.markers.size();i++){
    if (ma.markers.at(i).id == 10001){
      start = ma.markers.at(i).pose;
    }else if(ma.markers.at(i).id == 10002){//MAKE DYNAMIC
      goal = ma.markers.at(i).pose;
    }
  }
  double sx = start.position.x;
  double sy = start.position.y;
  double gx = goal.position.x;
  double gy = goal.position.y;

  double dist = sqrt(pow(sx-gx,2)+pow(sy-gy,2));
  double time_needed = ceil(dist/max_linear_vel);
  ramp_planner_new::TrajectoryRequest msg;
  msg.timeNeeded = time_needed;
  msg.type = "cubic";
  msg.points.push_back(start.position);
  msg.points.push_back(goal.position);
  std::cout<<"Trajectory Request:\n"<<msg<<std::endl;
  pub_time_needed.publish(msg);
}


void updateStartGoal(){
    curStartGoal.markers.clear();
    for(unsigned int i=0;i<pathPoints.markers.size();i++){
        if(pathPoints.markers.at(i).id == curStartId){
            curStartGoal.markers.push_back(pathPoints.markers.at(i));
            curStartGoal.markers.push_back(pathPoints.markers.at(i+1));
            break;
        }
    }
    getMinLinTime(curStartGoal);
}

void pathPointsCallback(const visualization_msgs::MarkerArray ma){
    pathPoints = ma;
    if(curStartId == -1){
        curStartId = ma.markers.at(0).id;
    }
    if(pathPoints.markers.size() > 2){
        geometry_msgs::Point p0,p1,p2;
        for(unsigned int i=0;i<pathPoints.markers.size();i++){
            if(pathPoints.markers.at(i).id == curStartId){
                p0 = pathPoints.markers.at(i).pose.position;
                p1 = pathPoints.markers.at(i + 1).pose.position;
                p2 = pathPoints.markers.at(i + 2).pose.position;
                break;
            }
        }
        double D1 = sqrt(pow(p0.x - p1.x,2) + pow(p0.y - p1.y,2));
        double D2 = sqrt(pow(p1.x - p2.x,2) + pow(p1.y - p2.y,2));
        double D = std::min(D1,D2);

        double v1[] = {p1.x - p0.x, p1.y - p0.y};
        double normFactor1 = sqrt(pow(v1[0],2) + pow(v1[1],2));
        double u1[] = {v1[0]/normFactor1, v1[1]/normFactor1};
        double v2[] = {p2.x - p1.x, p2.y - p1.y};
        double normFactor2 = sqrt(pow(v2[0],2) + pow(v2[0],2));
        double u2[] = {v2[0]/normFactor2, v2[1]/normFactor2};
        //find new control points
        geometry_msgs::Point cp1,cp2;
        for(float d=.1;d<=D;d+=.1){
            cp1.x = p1.x - d*u1[0];
            cp1.y = p1.y - d*u1[1];
            cp2.x = p1.x + d*u2[0];
            cp2.y = p1.y + d*u2[1];
        }
        //find bezier based on control
        //test that it's okay
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
  ros::NodeHandle handle_local("~");

  ros::Subscriber pathPointsListener  = handle.subscribe("path_points_channel", 1, pathPointsCallback);
  ros::Subscriber readyNextListener = handle.subscribe("ready_next", 1, getNextPoint);
  pub_path_points = handle.advertise<visualization_msgs::MarkerArray>("start_goal_channel",10);
  pub_time_needed = handle.advertise<ramp_planner_new::TrajectoryRequest>("/time_needed",1);
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
