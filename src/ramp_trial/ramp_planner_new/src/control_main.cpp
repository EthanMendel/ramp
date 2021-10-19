#include "ros/ros.h"
#include "../include/planner.h"

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
  std::cout<<"\nstarting listener\n";
  srand( time(0));

  ros::init(argc, argv, "ramp_listener_new");
  ros::NodeHandle handle;

  ros::Subscriber trajListener  = handle.subscribe("trajChannel", 1, trajCallback);
 
  ros::Rate r(20);
  ros::spin();
  r.sleep();

  printf("\n\nExiting Normally\n");
  ros::shutdown();
  return 0;
}
