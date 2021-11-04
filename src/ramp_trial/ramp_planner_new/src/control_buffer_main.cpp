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
