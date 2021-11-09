#include "../include/mobile_robot.h"
#include <std_msgs/Int8.h>

const std::string MobileRobot::TOPIC_STR_PHIDGET_MOTOR="PhidgetMotor";
const std::string MobileRobot::TOPIC_STR_ODOMETRY="odometry/filtered";
const std::string MobileRobot::TOPIC_STR_UPDATE="update";
const std::string MobileRobot::TOPIC_STR_TWIST="twist";
const std::string MobileRobot::TOPIC_STR_IC="imminent_collision";
const std::string MobileRobot::TOPIC_STR_SIM="/cmd_vel";
const std::string MobileRobot::TOPIC_STR_SIM2="/mobile_base/commands/velocity";
const std::string MobileRobot::TOPIC_STR_TIME_NEEDED="/time_needed";
const float BASE_WIDTH=0.2413;

const float timeNeededToTurn = 2.5; 

MobileRobot::MobileRobot() : restart_(false), num_(0), num_traveled_(0), k_dof_(3), max_linear_vel_(0.33), max_angular_vel_(1.5708)  
{ 
  for(unsigned int i=0;i<k_dof_;i++)
  {
    motion_state_.positions.push_back(0);
    motion_state_.velocities.push_back(0);
    motion_state_.accelerations.push_back(0);
    motion_state_.jerks.push_back(0);
  }

  prev_motion_state_ = motion_state_;


  zero_twist_.linear.x = 0.;
  zero_twist_.angular.z = 0.;
}

MobileRobot::~MobileRobot() {}

//assuming straight line path from start to goal
void MobileRobot::getMinLinTime(const visualization_msgs::MarkerArray& ma){
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
  double time_needed = ceil(dist/max_linear_vel_);
  std::cout<<"time needed for path: "<<time_needed<<"secs"<<std::endl;
  std_msgs::Int8 msg;
  msg.data = time_needed;
  pub_time_needed_.publish(msg);
}

/* 
 * This is a callback for receiving odometry from the robot and sets the configuration of the robot 
 * It does not mutate any motion data. The time value is added based on num_travaled_.
 */
void MobileRobot::odomCb(const nav_msgs::Odometry& msg) {
  //ROS_INFO("Received odometry update!");
 
  prev_motion_state_ = motion_state_;

  // Clear position and velocity vectors
  motion_state_.positions.clear();
  motion_state_.velocities.clear();
  motion_state_.accelerations.clear();
  
  // Set latest positions
  motion_state_.positions.push_back(msg.pose.pose.position.x);
  motion_state_.positions.push_back(msg.pose.pose.position.y);
  motion_state_.positions.push_back(tf::getYaw(msg.pose.pose.orientation));

  // Set latest velocities
  motion_state_.velocities.push_back(msg.twist.twist.linear.x);
  motion_state_.velocities.push_back(msg.twist.twist.linear.y);
  motion_state_.velocities.push_back(msg.twist.twist.angular.z);

  // Odometry does not have acceleration info, but
  // it would be pushed on here
//  std::vector<double> a = computeAcceleration();
//  for(unsigned int i=0;i<a.size();i++) 
//  {
//    motion_state_.accelerations.push_back(a.at(i));
//  }

  motion_state_.time = num_traveled_ ;//* CYCLE_TIME_IN_SECONDS;
  
  //ROS_INFO("Motion state: %s", utility_.toString(motion_state_).c_str());
    
  prev_t_ = ros::Time::now();
} // End updateState


void MobileRobot::imminentCollisionCb(const std_msgs::Bool msg)
{
  //ROS_INFO("In MobileRobot::imminentCollisionCb");
  //ROS_INFO("msg: %s", msg.data ? "True" : "False");
  imminent_coll_ = msg.data;
}

/** This method is on a timer to publish the robot's latest configuration */
void MobileRobot::updateCallback(const ros::TimerEvent& e) {
  //ROS_INFO("Publishing latest MotionState");
  //std::cout<<"\nIn updatePublishTimer\n";
  
  if (pub_update_) 
  {
      pub_update_.publish(motion_state_);
      //ROS_INFO("Motion state: %s", utility_.toString(motion_state_).c_str());
  }
} // End updatePublishTimer

void MobileRobot::updateCubic(const ramp_planner_new::CubicRepresentation& msg)
{
  if(msg != cubic_){
    cubic_ = msg;
  }
}

/** This method updates the MobileRobot's trajectory
 *   It calls calculateSpeedsAndTimes to update the robot's vectors needed to move */
void MobileRobot::setNextTwist() 
{
  // Update vectors for speeds and times
    twist_ = calculateVelocities(cubic_.coefficients, seg_step_);
} // End updateTrajectory

geometry_msgs::Twist MobileRobot::calculateVelocities(const std::vector<ramp_planner_new::Coefficient> coefs, int t){
  geometry_msgs::Twist twist;

  twist.linear.x = 3*coefs.at(0).values.at(0)*pow(t,2) + 2*coefs.at(0).values.at(1)*(t) + coefs.at(0).values.at(2);
  twist.linear.y = 3*coefs.at(1).values.at(0)*pow(t,2) + 2*coefs.at(1).values.at(1)*(t) + coefs.at(1).values.at(2);
  twist.linear.z = 3*coefs.at(2).values.at(0)*pow(t,2) + 2*coefs.at(2).values.at(1)*(t) + coefs.at(2).values.at(2);
  twist.angular.x = 0;
  twist.angular.y = 0;
  twist.angular.z = 0;

  return twist;
}

void MobileRobot::sendTwist() const 
{
  //ROS_INFO("In MobileRobot::sendTwist()");
  pub_twist_.publish(twist_); 

  // If we have the simulation up, publish to cmd_vel
  //if(sim_) 
  //{
    pub_cmd_vel_.publish(twist_);
    pub_cmd_vel2_.publish(twist_);
  //}
  
  //ROS_INFO("Exiting MobileRobot::sendTwist()");
}


void MobileRobot::sendTwist(const geometry_msgs::Twist t) const 
{
  pub_twist_.publish(t); 

  // If we have the simulation up, publish to cmd_vel
  // if(sim_) 
  // {
    pub_cmd_vel_.publish(t);
    pub_cmd_vel2_.publish(t);
  // }
}


/** This method prints out the information vectors */
void MobileRobot::printVectors() const 
{
    
  std::cout<<"\nspeeds_linear size: "<<speeds_linear_.size();
  std::cout<<"\nspeeds_linear: [";
  for(unsigned int i=0;i<speeds_linear_.size()-1;i++) 
  {
    std::cout<<speeds_linear_.at(i)<<", ";
  }
  std::cout<<speeds_linear_.at(speeds_linear_.size()-1)<<"]";
  
  std::cout<<"\nspeeds_angular size: "<<speeds_angular_.size();
  std::cout<<"\nspeeds_angular_: [";
  for(unsigned int i=0;i<speeds_angular_.size()-1;i++) 
  {
    std::cout<<speeds_angular_.at(i)<<", ";
  }
  std::cout<<speeds_angular_.at(speeds_angular_.size()-1)<<"]";

  std::cout<<"\nend_times size: "<<end_times.size();
  std::cout<<"\nend_times: [";
  for(unsigned int i=0;i<end_times.size()-1;i++) 
  {
    std::cout<<end_times.at(i)<<", ";
  }
  std::cout<<end_times.at(end_times.size()-1)<<"]";

  std::cout<<"\norientations_ size: "<<orientations_.size();
  std::cout<<"\norientations_: [";
  for(unsigned int i=0;i<orientations_.size()-1;i++) 
  {
    std::cout<<orientations_.at(i)<<", ";
  }
  std::cout<<orientations_.at(orientations_.size()-1)<<"]";
} // End printVectors

/** Returns true if there is imminent collision */
const bool MobileRobot::checkImminentCollision()  
{
  bool result = false;
  ros::param::get("imminent_collision", result);
  if(result)
  {
    ROS_ERROR("Imminent Collision exists! Stopping robot, initial_theta_: %f", initial_theta_);
  }
  //ROS_INFO("Imminent Collision: %s", result ? "True" : "False");
  return result;
} // End checkImminentCollision

/** This method moves the robot along trajectory_ */
void MobileRobot::moveOnTrajectory() 
{
  restart_ = false;
  ros::Rate r(20);
  ros::Rate r_ic(100);

  ros::Time s;

  double actual_theta, dist;
  if(cubic_.active == 1){
    // Execute the trajectory
    std::cout<<"starting full path portion"<<std::endl;
    while(ros::ok() && seg_step_ < cubic_.resolution) 
    {
      while(ros::ok() && time_step_ < SEND_RESELUTION) 
      {
        std::cout<<"\ttime_step_:"<<time_step_<<"\tseg_step_:"<<seg_step_<<std::endl;
        // ** Code that was used to maintain orientation ** //
        // Send the twist_message to move the robot
        sendTwist();
        time_step_++;
        // Sleep
        r.sleep();
        // Spin to check for updates
        ros::spinOnce();
      } // end while (move to the next point)
      // Increment num_traveled
      time_step_ = 0;
      seg_step_++;
      setNextTwist(); 
      // Spin once to check for updates in the trajectory
      ros::spinOnce();
    } // end while
    std::cout<<"finished full path portion"<<std::endl;
    cubic_.active = 0;
    std_msgs::Bool msg;
    msg.data = true;
    pub_ready_next_.publish(msg);
    // Check that we moved on a trajectory
  }
} // End moveOnTrajectory