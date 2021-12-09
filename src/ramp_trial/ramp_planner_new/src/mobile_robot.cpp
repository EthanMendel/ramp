#include "../include/mobile_robot.h"
#include <ramp_planner_new/TrajectoryRequest.h>

const std::string MobileRobot::TOPIC_STR_PHIDGET_MOTOR="/PhidgetMotor";
const std::string MobileRobot::TOPIC_STR_ODOMETRY="/odometry/filtered";
const std::string MobileRobot::TOPIC_STR_UPDATE="/update";
const std::string MobileRobot::TOPIC_STR_TWIST="/twist";
const std::string MobileRobot::TOPIC_STR_IC="/imminent_collision";
const std::string MobileRobot::TOPIC_STR_SIM="/cmd_vel";
const std::string MobileRobot::TOPIC_STR_SIM2="/mobile_base/commands/velocity";
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

void MobileRobot::updateTrajectory(const ramp_planner_new::TrajectoryRepresentation& msg)
{
  if(msg != trajectory_){
    std::cout<<"setting new "<<msg.type<<" trajectory"<<std::endl;
    trajectory_ = msg;
  }
}

/** This method updates the MobileRobot's trajectory
 *   It calls calculateSpeedsAndTimes to update the robot's vectors needed to move */
void MobileRobot::setNextTwist() 
{
  // Update vectors for speeds and times
    calculateVelocities(trajectory_.coefficients,trajectory_.uCoefficients, (seg_step_+.1*time_step_));
} // End updateTrajectory

void MobileRobot::calculateVelocities(const std::vector<ramp_planner_new::Coefficient> coefs, const std::vector<ramp_planner_new::Coefficient> uCoefs, double t){  
  std::vector<double> curXY;
  double xP;
  double yP;
  if(trajectory_.type == "cubic"){
    curXY = {
      coefs.at(0).values.at(0)*pow(t,3) + coefs.at(0).values.at(1)*pow(t,2) + coefs.at(0).values.at(2)*(t) + coefs.at(0).values.at(3),
      coefs.at(1).values.at(0)*pow(t,3) + coefs.at(1).values.at(1)*pow(t,2) + coefs.at(1).values.at(2)*(t) + coefs.at(1).values.at(3)
    };
     xP = 3*coefs.at(0).values.at(0)*pow(t,2) + 2*coefs.at(0).values.at(1)*(t) + coefs.at(0).values.at(2);
     yP = 3*coefs.at(1).values.at(0)*pow(t,2) + 2*coefs.at(1).values.at(1)*(t) + coefs.at(1).values.at(2);
  
  }else if(trajectory_.type == "bezier"){
    float xuMin = uCoefs.at(0).values.at(0)*pow(0,3) + uCoefs.at(0).values.at(1)*pow(0,2) + uCoefs.at(0).values.at(2)*(0) + uCoefs.at(0).values.at(3);
    float xuMax = (uCoefs.at(0).values.at(0)*pow(trajectory_.resolution,3) + uCoefs.at(0).values.at(1)*pow(trajectory_.resolution,2) + uCoefs.at(0).values.at(2)*(trajectory_.resolution) + uCoefs.at(0).values.at(3)) - xuMin;
    float yuMin = uCoefs.at(1).values.at(0)*pow(0,3) + uCoefs.at(1).values.at(1)*pow(0,2) + uCoefs.at(1).values.at(2)*(0) + uCoefs.at(1).values.at(3);
    float yuMax = (uCoefs.at(1).values.at(0)*pow(trajectory_.resolution,3) + uCoefs.at(1).values.at(1)*pow(trajectory_.resolution,2) + uCoefs.at(1).values.at(2)*(trajectory_.resolution) + uCoefs.at(1).values.at(3)) - yuMin;
    float xu = ((uCoefs.at(0).values.at(0)*pow(t,3) + uCoefs.at(0).values.at(1)*pow(t,2) + uCoefs.at(0).values.at(2)*(t) + uCoefs.at(0).values.at(3)) - xuMin)/xuMax;
    float yu = ((uCoefs.at(1).values.at(0)*pow(t,3) + uCoefs.at(1).values.at(1)*pow(t,2) + uCoefs.at(1).values.at(2)*(t) + uCoefs.at(1).values.at(3)) - yuMin)/yuMax;
    curXY = {
      pow(1-xu,2)*coefs.at(0).values.at(0) + xu*(1-xu)*coefs.at(0).values.at(1) + pow(xu,2)*coefs.at(0).values.at(2),
      pow(1-yu,2)*coefs.at(1).values.at(0) + yu*(1-yu)*coefs.at(1).values.at(1) + pow(yu,2)*coefs.at(1).values.at(2)
    };
    double A1 = 2*(coefs.at(0).values.at(0) - coefs.at(0).values.at(1) + coefs.at(0).values.at(2));
    double B1 = 2*(coefs.at(1).values.at(0) - coefs.at(1).values.at(1) + coefs.at(1).values.at(2));
    double A2 = 2*((coefs.at(0).values.at(1)/2)-coefs.at(0).values.at(0));
    double B2 = 2*((coefs.at(1).values.at(1)/2)-coefs.at(1).values.at(0));
    float xuP = 3*uCoefs.at(0).values.at(0)*pow(xu,2) + 2*uCoefs.at(0).values.at(1)*(xu) + uCoefs.at(0).values.at(2);
    float yuP = 3*uCoefs.at(1).values.at(0)*pow(yu,2) + 2*uCoefs.at(1).values.at(1)*(yu) + uCoefs.at(1).values.at(2);
    xP =((A1*xu + A2)*xuP);
    yP =((B1*yu + B2)*yuP);
  }else{
    std::cout<<"got "<<trajectory_.type<<" trajectory, something went wrong"<<std::endl;
    return;
  }

  speed_linear_ = sqrt(pow(xP,2) + pow(yP,2));
  twist_.linear.x = speed_linear_;

  if(prevXY_.size() > 0){
    double theta = findAngleFromAToB(curXY,prevXY_);
    if(prevTheta_){
      speed_angular_ = findDistanceBetweenAngles(prevTheta_,theta)*2;
      // if(trajectory_.type == "bezier"){
      //   speed_angular_= ang_holder;
      // }else{
      //   speed_angular_ = 0;
      // }
      twist_.angular.z = speed_angular_;
    }
    prevTheta_ = theta;
  }
  prevXY_ = curXY;
  std::cout<<"\tLin: "<<speed_linear_<<"\tAng: "<<speed_angular_<<std::endl;
}

/** return euclidean distance between two position vectors */
const double MobileRobot::positionDistance(const std::vector<double> a, const std::vector<double> b) const {
  double d_x = b.at(0) - a.at(0);
  double d_y = b.at(1) - a.at(1);
  return sqrt( pow(d_x,2) + pow(d_y,2) );
}

/** return the angle that forms a straight line from position a to position b. a and b are [x, y] vectors. */
const double MobileRobot::findAngleFromAToB(const std::vector<double> a, const std::vector<double> b) const {
  double result;
  // ff the positions are the same, return the orientation the robot already has
  if(fabs(positionDistance(a, b)) < 0.01 && a.size() > 2){
    return a.at(2);
  }
  // find the distances in x,y directions and euclidean distance
  double d_x = b.at(0) - a.at(0);
  double d_y = b.at(1) - a.at(1);
  
  double euc_dist = sqrt( pow(d_x,2) + pow(d_y,2) );
  // if the positions are the same,
  // set the result to the starting orientation if one is provided
  // or to 0 if no starting orientation is provided
  if(euc_dist <= 0.0001) {
    result = 0;
  }
  // b in the 1st or 2nd quadrants
  else if(d_y > 0) {
    result = acos(d_x / euc_dist);
  }
  // b in the 3rd quadrant, d_y<0 & d_x<0
  else if(d_x < 0) {
    result = -PI - asin(d_y / euc_dist);
  }
  // b in the 4th quadrant, d_y<=0 & d_x>=0
  else {
    result = asin(d_y / euc_dist); 
  }
  return result;
}

/** return distance between orientations a1 and a2 in range [-PI, PI]. */
const double MobileRobot::findDistanceBetweenAngles(const double a1, const double a2) const{
  double result;
  double difference = a2 - a1;
  // difference > pi, should be [-PI,0]
  if(difference > PI) {
    difference = fmodf(difference, PI);
    result = difference - PI;
  }
  // difference < -pi, should be [0,PI]
  else if(difference < -PI){
    result = difference + (2*PI);
  }
  // else, difference is fine
  else {
    result = difference;
  }
  return result;
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
  if(trajectory_.active == 1){
    // Execute the trajectory
    std::cout<<"starting full path portion"<<std::endl;
    // setNextTwist(); 
    while(ros::ok() && seg_step_ < trajectory_.resolution) 
    {
      while(ros::ok() && time_step_ < SEND_RESELUTION) 
      {
        std::cout<<"\ttime_step_:"<<time_step_<<"\tseg_step_:"<<seg_step_<<std::endl;
        // ** Code that was used to maintain orientation ** //
        // Send the twist_message to move the robot
        setNextTwist();
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
      // setNextTwist(); 
      // Spin once to check for updates in the trajectory
      ros::spinOnce();
    } // end while
    std::cout<<"finished full path portion"<<std::endl;
    seg_step_ = 0;
    time_step_ = 0;
    trajectory_.active = 0;
    std_msgs::Bool msg;
    msg.data = true;
    pub_ready_next_.publish(msg);
    // Check that we moved on a trajectory
  }
} // End moveOnTrajectory