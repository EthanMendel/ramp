#include "ros/ros.h"
#include "../include/planner.h"
#include "../include/mobile_robot.h"

MobileRobot robot;

void trajCallback(const ramp_planner_new::CubicRepresentation cubic){
  std::cout<<"got path in trajCallback"<<std::endl;
  //how to determin t value to use
  std::cout<<"all twists sent"<<std::endl;
}

int main(int argc, char** argv) {
  std::cout<<"\nstarting listener\n";
  srand( time(0));

  ros::init(argc, argv, "ramp_listener_new");
  ros::NodeHandle handle;

  robot.pub_twist_ = handle.advertise<geometry_msgs::Twist>(MobileRobot::TOPIC_STR_TWIST, 1000);
  ros::Subscriber trajListener  = handle.subscribe("coef_channel", 1, trajCallback);
 
  ros::Rate r(20);
  ros::spin();
  r.sleep();

  printf("\n\nExiting Normally\n");
  ros::shutdown();
  return 0;
}
