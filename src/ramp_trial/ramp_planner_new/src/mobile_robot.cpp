#include "../include/mobile_robot.h"

const std::string MobileRobot::TOPIC_STR_PHIDGET_MOTOR="PhidgetMotor";
const std::string MobileRobot::TOPIC_STR_ODOMETRY="odometry";
const std::string MobileRobot::TOPIC_STR_UPDATE="update";
const std::string MobileRobot::TOPIC_STR_TWIST="twist";
const std::string MobileRobot::TOPIC_STR_IC="imminent_collision";
const std::string MobileRobot::TOPIC_STR_SIM="cmd_vel";
const std::string MobileRobot::TOPIC_STR_SIM2="/mobile_base/commands/velocity";
const double TIME_DELTA = 1/10;
const float BASE_WIDTH=0.2413;

const float timeNeededToTurn = 2.5; 

MobileRobot::MobileRobot() : restart_(false), num_(0), num_traveled_(0), k_dof_(3)  
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

/** This method updates the MobileRobot's trajectory
 *   It calls calculateSpeedsAndTimes to update the robot's vectors needed to move */
void MobileRobot::updateTrajectory(const ramp_planner_new::CubicRepresentation& msg) 
{
  ros::Time now = ros::Time::now();
  // Update vectors for speeds and times
  // std::cout<<"updating trajector.."<<std::endl;
  if((now.toSec() - t_prev_traj_.toSec()) >= TIME_DELTA && seg_step_ < msg.resolution)
  {
    t_prev_traj_ = now;
    time_step_ = time_step_ + 1;
    if(time_step_ == pow(TIME_DELTA,-1)){//every second should have a new t value
                                         //to be more exact: 'could' calculate t based on delta from global start time
      time_step_ = 0;
      seg_step_ = seg_step_ + 1;
    }
    // std::cout<<"\ttime_step_:"<<time_step_<<std::endl;
    // std::cout<<"\tseg_step_:"<<seg_step_<<std::endl;
    twist_ = calculateVelocities(msg.coefficients, seg_step_);
    sendTwist();
    // sendTwist();
    // sendTwist();
  }
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

  // Execute the trajectory
  while(ros::ok() && (num_traveled_+1) < num_) 
  {
    //ROS_INFO("num_traveled_: %i/%i", num_traveled_, num_);
    //ROS_INFO("At state: %s", utility_.toString(motion_state_).c_str());
    s = ros::Time::now();
    restart_ = false;
 

    // Force a stop until there is no imminent collision
    if(check_imminent_coll_)
    {
      ros::Time t_startIC = ros::Time::now();
      while(imminent_coll_ && ros::ok()) {
        ROS_ERROR("Imminent Collision Exists, Stopping robot");
        sendTwist(zero_twist_);
        r_ic.sleep();
        ros::spinOnce();
      }
      t_immiColl_ += ros::Time::now() - t_startIC;
    }
    //ROS_INFO("t_immiColl_: %f", t_immiColl_.toSec());

    
    // If a new trajectory was received, restart the outer while 
    if(restart_) 
    {
      continue;
    }

    // Move to the next point
    ros::Time g_time = end_times.at(num_traveled_) + t_immiColl_;
    //ros::Time g_time = end_times.at(num_traveled_);
    //ROS_INFO("now: %f g_time: %f", ros::Time::now().toSec(), g_time.toSec());
    while(ros::ok() && ros::Time::now() < g_time) 
    {
      // If a new trajectory was received, restart the outer while 
      if(restart_)
      {
        continue;
      }
      
      twist_.linear.x   = speeds_linear_.at(num_traveled_);
      twist_.angular.z  = speeds_angular_.at(num_traveled_);
 
      // When driving straight, adjust the angular speed 
      // to maintain orientation
      // TODO: Works with Bezier curve?
      if(fabs(twist_.linear.x) > 0.0f && fabs(twist_.angular.z) < 0.0001f) 
      {
        //ROS_INFO("initial_theta_: %f motion_state_.positions.at(2): %f", initial_theta_, motion_state_.positions.at(2));
//        actual_theta = utility_.displaceAngle(initial_theta_, motion_state_.positions.at(2));
//        dist = utility_.findDistanceBetweenAngles(actual_theta, orientations_.at(num_traveled_));
        //ROS_INFO("actual_theta: %f orientations[%i]: %f dist: %f", actual_theta, num_traveled_, orientations_.at(num_traveled_), dist);
        twist_.angular.z = dist/2.f;
      }

      //ROS_INFO("twist.linear.x: %f twist.angular.z: %f", twist_.linear.x, twist_.angular.z);

      // Send the twist_message to move the robot
      sendTwist();
      
      // Sleep
      r.sleep();
    
      // Spin to check for updates
      ros::spinOnce();
    } // end while (move to the next point)
    
    // If a new trajectory was received, restart the outer while 
    if(restart_) 
    {
      continue;
    }

    // Increment num_traveled
    num_traveled_++;

    // Spin once to check for updates in the trajectory
    ros::spinOnce();

    //t_points_.push_back(ros::Time::now() - s);
    //ROS_INFO("Point took %f", (ros::Time::now() - s).toSec());
  } // end while

  // Check that we moved on a trajectory
  if(num_traveled_ > 1)
  {
    // Stops the wheels
    twist_.linear.x = 0;
    twist_.angular.z = 0;
    sendTwist();
    sendTwist();

    // Set num and num_traveled so we don't come back into this if-block each time
    num_ = 0;
    num_traveled_ = 0;
  } // end if finished a trajectory
} // End moveOnTrajectory
