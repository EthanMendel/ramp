#include "ros/ros.h"
#include "../include/planner.h"
#include "../include/mobile_robot.h"
#include <ramp_planner_new/TrajectoryRequest.h>

MobileRobot robot;

/** Initialize the MobileRobot's publishers and subscibers*/
void init_advertisers_subscribers(MobileRobot& robot, ros::NodeHandle& handle, bool simulation) 
{
  // Publishers
  robot.pub_twist_ = handle.advertise<geometry_msgs::Twist>(MobileRobot::TOPIC_STR_TWIST, 1000);
  robot.pub_update_ = handle.advertise<ramp_msgs::MotionState>(MobileRobot::TOPIC_STR_UPDATE, 1000);

  robot.pub_cmd_vel_ = handle.advertise<geometry_msgs::Twist>(MobileRobot::TOPIC_STR_SIM, 10);
  robot.pub_cmd_vel2_ = handle.advertise<geometry_msgs::Twist>(MobileRobot::TOPIC_STR_SIM2, 10);
  
  robot.pub_ready_next_ = handle.advertise<std_msgs::Bool>("ready_next", 1);
  // Subscribers
  robot.sub_odometry_ = handle.subscribe(MobileRobot::TOPIC_STR_ODOMETRY, 1, &MobileRobot::odomCb, &robot);
  robot.sub_imminent_collision_ = handle.subscribe(MobileRobot::TOPIC_STR_IC, 1, &MobileRobot::imminentCollisionCb, &robot);
  // Timers
  // 15 Hz seems to be the fastest possible while avoiding nan errors
  robot.timer_ = handle.createTimer(ros::Duration(1.f / 30.f), &MobileRobot::updateCallback, &robot);
} // End init_advertisers_subscribers

void trajCallback(const ramp_planner_new::TrajectoryRepresentation cubic){
  robot.updateCubic(cubic);
}

int main(int argc, char** argv) {
  std::cout<<"\nstarting listener\n";
  srand( time(0));

  ros::init(argc, argv, "ramp_controller_new");
  ros::NodeHandle handle;
  ros::NodeHandle handle_local("~");

  ros::Subscriber trajListener  = handle.subscribe("coef_channel", 1, trajCallback);
  setvbuf(stdout, NULL, _IOLBF, 4096);

  bool sim = true;

  init_advertisers_subscribers(robot,handle,sim);

  ros::Rate r(1000);
  while(ros::ok()) 
  {
    robot.moveOnTrajectory();
    r.sleep();
    ros::spinOnce();
  }

  fflush(stdout);

  std::cout<<"\nExiting Normally\n";
  return 0;
}
