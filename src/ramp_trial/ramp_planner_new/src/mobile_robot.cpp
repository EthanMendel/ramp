#include "../include/mobile_robot.h"
#include <ramp_planner_new/SwapRequest.h>

const std::string MobileRobot::TOPIC_STR_PHIDGET_MOTOR="/PhidgetMotor";
const std::string MobileRobot::TOPIC_STR_ODOMETRY="/odometry/filtered";
const std::string MobileRobot::TOPIC_STR_UPDATE="/update";
const std::string MobileRobot::TOPIC_STR_TWIST="/twist";
const std::string MobileRobot::TOPIC_STR_IC="/imminent_collision";
const std::string MobileRobot::TOPIC_STR_SIM="/cmd_vel";
const std::string MobileRobot::TOPIC_STR_SIM2="/mobile_base/commands/velocity";
const std::string MobileRobot::TOPIC_TRAJ_SWAP="/traj_swap";
const float BASE_WIDTH=0.2413;

const float timeNeededToTurn = 2.5; 

MobileRobot::MobileRobot() : k_dof_(3) {}

MobileRobot::~MobileRobot() {}

void MobileRobot::imminentCollisionCb(const std_msgs::Bool msg)
{
  //ROS_INFO("In MobileRobot::imminentCollisionCb");
  //ROS_INFO("msg: %s", msg.data ? "True" : "False");
  imminent_coll_ = msg.data;
}

void MobileRobot::updateTrajectory(const ramp_planner_new::TrajectoryRepresentation& msg)
{
  if(msg != trajectory_){
    std::cout<<"setting new "<<msg.type<<" trajectory for "<<msg.totalTime<<" secs starting at "<<msg.startTime<<" ending at "<<msg.totalTime<<std::endl;
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
  if(trajectory_.type == "cubic"){
    curXY = {//position's velocity coefficient should be zero
      coefs.at(0).values.at(0)*pow(t,3) + coefs.at(0).values.at(1)*pow(t,2) + coefs.at(0).values.at(2)*(t) + coefs.at(0).values.at(3),
      coefs.at(1).values.at(0)*pow(t,3) + coefs.at(1).values.at(1)*pow(t,2) + coefs.at(1).values.at(2)*(t) + coefs.at(1).values.at(3)
    };
     xP_ = 3*coefs.at(0).values.at(0)*pow(t,2) + 2*coefs.at(0).values.at(1)*(t) + coefs.at(0).values.at(2);
     yP_ = 3*coefs.at(1).values.at(0)*pow(t,2) + 2*coefs.at(1).values.at(1)*(t) + coefs.at(1).values.at(2);
  
  }else if(trajectory_.type == "bezier"){
    float xu = ((uCoefs.at(0).values.at(0)*pow(t,3) + uCoefs.at(0).values.at(1)*pow(t,2) + uCoefs.at(0).values.at(2)*(t) + uCoefs.at(0).values.at(3)));// - xuMin)/xuMax;
    float yu = ((uCoefs.at(1).values.at(0)*pow(t,3) + uCoefs.at(1).values.at(1)*pow(t,2) + uCoefs.at(1).values.at(2)*(t) + uCoefs.at(1).values.at(3)));// - yuMin)/yuMax;
    curXY = {
      pow(1-xu,2)*coefs.at(0).values.at(0) + 2*xu*(1-xu)*coefs.at(0).values.at(1) + pow(xu,2)*coefs.at(0).values.at(2),
      pow(1-yu,2)*coefs.at(1).values.at(0) + 2*yu*(1-yu)*coefs.at(1).values.at(1) + pow(yu,2)*coefs.at(1).values.at(2)
    };
    double A1 = 2*(coefs.at(0).values.at(0) - 2*coefs.at(0).values.at(1) + coefs.at(0).values.at(2));
    double B1 = 2*(coefs.at(1).values.at(0) - 2*coefs.at(1).values.at(1) + coefs.at(1).values.at(2));
    double A2 = 2*((coefs.at(0).values.at(1))-coefs.at(0).values.at(0));
    double B2 = 2*((coefs.at(1).values.at(1))-coefs.at(1).values.at(0));
    float xuP = 3*uCoefs.at(0).values.at(0)*pow(t,2) + 2*uCoefs.at(0).values.at(1)*(t) + uCoefs.at(0).values.at(2);
    float yuP = 3*uCoefs.at(1).values.at(0)*pow(t,2) + 2*uCoefs.at(1).values.at(1)*(t) + uCoefs.at(1).values.at(2);
    xP_ =((A1*xu + A2)*xuP);
    yP_ =((B1*yu + B2)*yuP);
  }else{
    std::cout<<"got "<<trajectory_.type<<" trajectory, something went wrong"<<std::endl;
    return;
  }

  speed_linear_ = sqrt(pow(xP_,2) + pow(yP_,2));
  twist_.linear.x = speed_linear_;

  if(prevXY_.size() > 0){
    double theta = findAngleFromAToB(curXY,prevXY_);
    if(prevTheta_){
      speed_angular_ = findDistanceBetweenAngles(prevTheta_,theta)/CYCLE_TIME_IN_SECONDS;
      twist_.angular.z = speed_angular_;
    }
    prevTheta_ = theta;
  }
  prevXY_ = curXY;
  std::cout<<"\tcurXY:\t("<<curXY.at(0)<<",\t"<<curXY.at(1)<<")"<<std::endl;
  std::cout<<"\tt: "<<t<<"\tLin: "<<speed_linear_<<"\tAng: "<<speed_angular_<<std::endl;
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

  pub_cmd_vel_.publish(twist_);
  pub_cmd_vel2_.publish(twist_);
  
  //ROS_INFO("Exiting MobileRobot::sendTwist()");
}


void MobileRobot::sendTwist(const geometry_msgs::Twist t) const 
{
  pub_twist_.publish(t); 

  pub_cmd_vel_.publish(t);
  pub_cmd_vel2_.publish(t);
}

/** This method moves the robot along trajectory_ */
void MobileRobot::moveOnTrajectory() {
  ros::Rate r(10);
  if(!started_){
    started_ = true;
    global_start_ = ros::Time::now();
    tot_time_ = 0;
    swapped_ = false;
  }
  if(trajectory_.active){
    // Execute the trajectory
    std::cout<<"starting full path portion"<<std::endl;
    // setNextTwist(); 
    seg_step_ = (int) trajectory_.startTime;
    time_step_ = (int) ((trajectory_.startTime - seg_step_) * 10);
    cur_start_ = ros::Time::now();
    while(ros::ok() && (seg_step_+.1*time_step_) <= trajectory_.totalTime) 
    {
      while(ros::ok() && time_step_ < SEND_RESELUTION) 
      {
        cur_time_ = ros::Time::now();
        // std::cout<<"$$calculated: "<<(seg_step_+.1*time_step_)<<"\tfound: "<<cur_time_ - cur_start_ - global_start_<<std::endl;
        if((seg_step_+.1*time_step_) > trajectory_.totalTime){
          break;
        }
        if(tot_time_ > 2.0 && !swapped_){
          swapped_ = true;
          trajectory_.active = false;
          ramp_planner_new::SwapRequest msg;
          msg.curLinVelX = xP_;
          msg.curLinVelY = yP_;
          pub_swap_traj_.publish(msg);
          break;
        }
        // std::cout<<"running for "<<(seg_step_+.1*time_step_)<<std::endl;
        // Send the twist_message to move the robot
        setNextTwist();
        sendTwist();
        time_step_++;
        tot_time_ = tot_time_ + .1;
        // Sleep
        r.sleep();
        // Spin to check for updates
        ros::spinOnce();
      } // end while (move to the next point)
      if(!trajectory_.active){
        break;
      }
      // Increment num_traveled
      time_step_ = 0;
      seg_step_++;
      // Spin once to check for updates in the trajectory
      ros::spinOnce();
    } // end while
    if(trajectory_.active){
      std::cout<<"finished full path portion"<<std::endl;
      seg_step_ = 0;
      time_step_ = 0;
      trajectory_.active = 0;
      std_msgs::Bool msg;
      msg.data = true;
      pub_ready_next_.publish(msg);
    }else{
      trajectory_.active = false;
    }
    // Check that we moved on a trajectory
  }
} // End moveOnTrajectory