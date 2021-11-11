#include "ros/ros.h"
#include "visualization_msgs/MarkerArray.h"
#include <std_msgs/Bool.h>

visualization_msgs::MarkerArray pathPoints;
int curStartId = -1;
visualization_msgs::MarkerArray curStartGoal;
ros::Publisher pub_path_points;

void updateStartGoal(){
    curStartGoal.markers.clear();
    for(unsigned int i=0;i<pathPoints.markers.size();i++){
        if(pathPoints.markers.at(i).id == curStartId){
            curStartGoal.markers.push_back(pathPoints.markers.at(i));
            curStartGoal.markers.push_back(pathPoints.markers.at(i+1));
            break;
        }
    }
    pub_path_points.publish(curStartGoal);
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
        for(float d=.1;d<=D;d+=.1){

        }

        //find new control points
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
