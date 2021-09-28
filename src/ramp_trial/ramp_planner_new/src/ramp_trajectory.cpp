#include "../include/ramp_trajectory.h"

RampTrajectory::RampTrajectory(unsigned int id) 
{
  msg_.id = id;
  msg_.feasible = true;
  msg_.fitness = -1;  
  msg_.t_firstCollision = ros::Duration(9999.f);
  msg_.t_start          = ros::Duration(0.f);
  msg_.trajectory.points.reserve(100);
}

RampTrajectory::RampTrajectory(const ramp_msgs::RampTrajectory msg) : msg_(msg) {}


bool RampTrajectory::equals(const RampTrajectory& other, const double& epsilon) const 
{
  //ROS_INFO("In RampTrajectory::equals");
  if(msg_.id == other.msg_.id) 
  {
    return true;
  }

  //Path templ(msg_.holonomic_path);
  //Path tempr(other.msg_.holonomic_path);
  Path templ = getNonHolonomicPath();
  Path tempr = other.getNonHolonomicPath();

  ////ROS_INFO("Exiting RampTrajectory::equals");
  //return msg_.holonomic_path.equals(other.msg_.holonomic_path);
  return templ.equals(tempr, epsilon);
}


const double RampTrajectory::getT() const
{
  return msg_.trajectory.points.at(msg_.trajectory.points.size()-1).time_from_start.toSec();
}

const Path RampTrajectory::getNonHolonomicPath() const 
{
  //ROS_INFO("trajec: %s", toString().c_str());
  Path result;

  for(unsigned int i=0;i<msg_.i_knotPoints.size();i++)
  {
    //ROS_INFO("i: %i msg_.i_knotPoints: %i", i, msg_.i_knotPoints[i]);

    MotionState ms(msg_.trajectory.points.at( msg_.i_knotPoints.at(i)));
    KnotPoint kp_ms(ms);

    result.msg_.points.push_back(kp_ms.buildKnotPointMsg());
  }

  result.start_ = result.msg_.points[0];
  result.goal_  = result.msg_.points[ result.msg_.points.size()-1 ];
  
  return result;
}

/** Time is in seconds */
const trajectory_msgs::JointTrajectoryPoint RampTrajectory::getPointAtTime(const float t) const 
{
  ////////ROS_INFO("In RampTrajectory::getPointAtTime");
  
  
  float resolutionRate = 0.1;
  int i = ceil((t/resolutionRate));
  /*//////ROS_INFO("t: %f resolutionRate: %f i: %i size: %i", 
      t, 
      resolutionRate, 
      i, 
      (int)msg_.trajectory.points.size());*/

  if( i >= msg_.trajectory.points.size() ) {
    return msg_.trajectory.points.at( msg_.trajectory.points.size()-1 );
  }

  return msg_.trajectory.points.at(i);
}

/** Returns the direction of the trajectory, i.e. the
* orientation the base needs to move on the trajectory */
const double RampTrajectory::getDirection() const 
{
  //std::cout<<"\nIn getDirection\n";
  std::vector<double> a = msg_.holonomic_path.points[0].motionState.positions;

  std::vector<double> b = msg_.holonomic_path.points[1].motionState.positions;

    //msg_.trajectory.points.at(msg_.i_knotPoints.at(2)) :
    //msg_.trajectory.points.at(msg_.i_knotPoints.at(1)) ;
  //std::cout<<"\nLeaving getDirection\n";
  return utility_.findAngleFromAToB(a, b);
}

const RampTrajectory RampTrajectory::clone() const 
{ 
  return *this;
}

const std::string RampTrajectory::toString(bool printKnotPoints) const 
{
  std::ostringstream result;
  
  result<<"\nTrajectory ID: "<<msg_.id<<"\nTrajec: "<<utility_.toString(msg_, printKnotPoints);
  result<<"\n Fitness: "<<msg_.fitness<<" Collision Time: "<<msg_.t_firstCollision<<" Feasible: "<<(int)msg_.feasible;
  result<<"\n   Transition traj size: "<<transitionTraj_.trajectory.points.size();
  
  return result.str();
}




