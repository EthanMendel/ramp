#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "ramp_msgs/MotionState.h"
#include "ramp_msgs/ObstacleList.h"
#include "utility.h"

std::vector< std::string > ob_odoms;
std::vector< std::string > ob_vels;
std::vector< ros::Publisher > ob_pubs;
std::vector< double > ob_delays;
std::vector< ros::Duration > dur_delays;
std::vector< ros::Timer > ob_timers;
ros::Time node_start;
Utility utility;

std::vector<ros::Subscriber> sub_ob_ic;
std::vector<bool> ob_ic;

void getObstacleParams(const ros::NodeHandle handle){
  if(handle.hasParam("/ramp/obstacle_odoms")){
    handle.getParam("/ramp/obstacle_odoms", ob_odoms);
    ROS_INFO("ob_odoms.size(): %i", (int)ob_odoms.size());
    for(int i=0;i<ob_odoms.size();i++){
      ROS_INFO("ob_odoms[%i]: %s", i, ob_odoms.at(i).c_str());
    }
  }


  if(handle.hasParam("/ramp/obstacle_vels")){
    handle.getParam("/ramp/obstacle_vels", ob_vels);
    ROS_INFO("ob_vels.size(): %i", (int)ob_vels.size());
    for(int i=0;i<ob_vels.size();i++){
      ROS_INFO("ob_vels[%i]: %s", i, ob_vels.at(i).c_str());
    }
  }


  if(handle.hasParam("/ramp/obstacle_delays")){
    handle.getParam("/ramp/obstacle_delays", ob_delays);

    for(int i=0;i<ob_delays.size();i++){
      ROS_INFO("ob_delay[%i]: %f", i, ob_delays.at(i));
      dur_delays.push_back(ros::Duration(ob_delays.at(i)));
    }
  }
}

void turn(const int index, const double v, const double w, const double t){
  ros::Rate r(15);
  ros::Duration d(t);
  geometry_msgs::Twist twist;
  
  twist.linear.x = v;
  twist.linear.y = 0.f;
  twist.linear.z = 0.f;
  twist.angular.x = 0.f;
  twist.angular.y = 0.f;
  twist.angular.z = w;
 
  // drive
  ros::Time start = ros::Time::now();
  while(ros::Time::now() - start < d){
    ob_pubs.at(index).publish(twist);
    r.sleep();
  }
}

void SLike(const int index, const double v, const double w, const double t){
  double t_each = t/4.f;

  turn(index, v, w, t_each);
  turn(index, v, -w, t_each);
  turn(index, v, w, t_each);
  turn(index, v, -w, t_each);
}

void driveStraight(const int index, const double v, const double t){

  ros::Rate r(25);
  ros::Duration d(t);
  geometry_msgs::Twist twist;
  
  twist.linear.x = v;
  twist.linear.y = 0.f;
  twist.linear.z = 0.f;
  twist.angular.x = 0.f;
  twist.angular.y = 0.f;
  twist.angular.z = 0.f;
 
  int i=0;
  // drive forward
  ros::Time start = ros::Time::now();
  while(ros::ok() && (ros::Time::now() - start < d)){
    ob_pubs.at(index).publish(twist);
    r.sleep();
  }
}

void publishToOb(const ros::TimerEvent e, const int index){
  ros::Rate r(5);
  ros::Duration d(1.5);
  geometry_msgs::Twist twist;
  
  twist.linear.x = 0.33f;
  twist.linear.y = 0.f;
  twist.linear.z = 0.f;
  twist.angular.x = 0.f;
  twist.angular.y = 0.f;
  twist.angular.z = 0.f;

  // just one obstacle
  driveStraight(index, 0.33f, 5);

  // stop
  twist.linear.x = 0.;
  twist.angular.z = 0.;
  for(int i=0;i<10;i++){
    ob_pubs.at(index).publish(twist);
  }
}


void setDists(const ramp_msgs::ObstacleList obs){
  for(uint8_t i=0;i<obs.obstacles.size();i++){    
    std::vector<double> ob_loc;
  }
}

void publishToAllObs(const geometry_msgs::Twist twist){
  for(uint8_t i=0;i<ob_pubs.size();i++){
    ob_pubs.at(i).publish(twist);
  }
}


void obIcCb(const std_msgs::Bool::ConstPtr data, const int index){
  if(index < ob_ic.size()){
    ob_ic.at(index) = data->data;
  }else{
    ob_ic.push_back(data->data);
  }
}

int main(int argc, char** argv){
  ros::init(argc, argv, "obstacle");
  ros::NodeHandle handle;
  ros::Rate r(5);
  ros::Duration d(3.);
  geometry_msgs::Twist twist;

  getObstacleParams(handle);
  ROS_INFO("Obtained obstacle rosparams, please review and hit enter to continue");
  
  // create publishers
  for(uint8_t i=0;i<ob_vels.size();i++){
    ros::Publisher pub_twist = handle.advertise<geometry_msgs::Twist>(ob_vels.at(i), 1000);
    ob_pubs.push_back(pub_twist);
  }
  ROS_INFO("Waiting for /ramp/cc_started=true...");

  // wait for robot to start moving
  bool cc_started = false;
  while(!cc_started){
    handle.getParam("/ramp/cc_started", cc_started);
    r.sleep();
    ros::spinOnce();
  }
  node_start = ros::Time::now();
  // start timers
  for(uint8_t i=0;i<ob_delays.size();i++)
  {
    ros::Timer temp = handle.createTimer(ros::Duration(ob_delays.at(i)), boost::bind(publishToOb, _1, i), true, true);
    ob_timers.push_back(temp);
  }

 
 for(uint8_t i=0;i<ob_odoms.size();i++){
   ob_ic.push_back(false);
   std::stringstream topic_str;
   topic_str<<"/obstacle_"<<(int)i<<"/ob_imminent_collision";
   ROS_INFO("topic_str: %s", topic_str.str().c_str());
   ros::Subscriber sub = handle.subscribe<std_msgs::Bool>(topic_str.str(), 10, boost::bind(obIcCb, _1, i));
   sub_ob_ic.push_back(sub);
 }
  ROS_INFO("Starting obstacle motion!");
  ROS_INFO("Obstacle node done");
  ros::AsyncSpinner spinner(8);
  std::cout<<"\nWaiting for requests...\n";
  spinner.start();
  ros::waitForShutdown();
  return 0;
}
