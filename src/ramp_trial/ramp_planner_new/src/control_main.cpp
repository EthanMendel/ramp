#include "ros/ros.h"
#include "../include/planner.h"
#include "../include/mobile_robot.h"
#include <ramp_planner_new/TrajectoryRequest.h>
#include <ramp_planner_new/SwapRequest.h>
#include "visualization_msgs/MarkerArray.h"
#include <std_msgs/Bool.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Point.h>
#include <ramp_planner_new/PathPoints.h>
#include <ramp_planner_new/BezifyRequest.h>
#include <ramp_planner_new/TrajectorySwap.h>
#include <ramp_planner_new/Population.h>
#include <ramp_planner_new/ObstacleList.h>
#include <utility.h>
#include "obstacle.h"


MobileRobot robot;
Utility utility;

std::vector<ramp_planner_new::PathPoints> pathPointsPopulation;
ramp_planner_new::PathPoints curPathPoints;
std::vector<Obstacle> obstacles;
int maxPathId = 0;
int curStartId = -1;
int maxObsId = 0;
visualization_msgs::MarkerArray curStartGoal;
ros::Publisher pub_path_points;
ros::Publisher pub_time_needed;
ros::Publisher pub_bezify_request;
double max_speed_linear = 0.33;
bool swapped = false;
bool evaluate = true;
bool gotObs = false;
bool gettingNext = false;
std::vector<double> startingVels;


/** Initialize the MobileRobot's publishers and subscibers*/
void init_advertisers_subscribers(MobileRobot& robot, ros::NodeHandle& handle, bool simulation) 
{
  // Publishers
  robot.pub_twist_ = handle.advertise<geometry_msgs::Twist>(MobileRobot::TOPIC_STR_TWIST, 1000);

  robot.pub_cmd_vel_ = handle.advertise<geometry_msgs::Twist>(MobileRobot::TOPIC_STR_SIM, 10);
  robot.pub_cmd_vel2_ = handle.advertise<geometry_msgs::Twist>(MobileRobot::TOPIC_STR_SIM2, 10);
  
  // Subscribers
  robot.sub_imminent_collision_ = handle.subscribe(MobileRobot::TOPIC_STR_IC, 1, &MobileRobot::imminentCollisionCb, &robot);
} // End init_advertisers_subscribers


// j should be the index of the goal marker within pathPoints
bool needBezify(const unsigned int j){
    //type indexes are based on start index
    if(j > 0 and j < curPathPoints.types.size()){
        int offset = curPathPoints.types.at(j) == "SKIP" ? 1 : 0;
        //return whether both types involving the inputed point are cubic (linear)
        if(curPathPoints.types.at(j-1) == "cubic" && curPathPoints.types.at(j + offset) == "cubic"){
            std::cout<<"two cubics side by side"<<std::endl;
            return true;
        }else if(curPathPoints.types.at(j-1) == "uCubic" && curPathPoints.types.at(j + offset) == "uCubic"){
            std::cout<<"foud a u trajectory, **something went wrong**"<<std::endl;
            return false;
        }
        else{
            std::cout<<"cubic and bezier side by side"<<std::endl;
            return false;
        }
    }else{
        std::cout<<"at begining or end of path"<<std::endl;
        return false;
    }
}

void updateStartGoal(){
    if(!gotObs){
        return;
    }
    curStartGoal.markers.clear();
    unsigned int j=0;//j used as iterator for types, as types.size() = markers.size()-1
    for(int i=0;i<curPathPoints.markers.size();i++){
        if(curPathPoints.markers.at(i).id == curStartId){//find the current start marker based on id
            if(!curPathPoints.forBez.at(i)){//if the current start is only for bezier calculation
                curStartId += 1;//skip it
                j++;
                continue;
            }
            if(i < curPathPoints.markers.size() - 1){//make sure there there is a next point (as a goal)
                if(needBezify(j + 1)){//need bezify checks to make sure we can do i+2
                    //if we need to bezify the path, send bezify request
                    ramp_planner_new::BezifyRequest br;
                    br.pathPoints = curPathPoints;
                    br.markers.push_back(curPathPoints.markers.at(i));
                    br.markers.push_back(curPathPoints.markers.at(i+1));
                    br.markers.push_back(curPathPoints.markers.at(i+2));
                    br.pathId = curPathPoints.id;
                    pub_bezify_request.publish(br);
                }else{//else, no bezify needed
                    curStartGoal.markers.push_back(curPathPoints.markers.at(i));
                    curStartGoal.markers.push_back(curPathPoints.markers.at(i+1));
                    ramp_planner_new::TrajectoryRequest msg;
                    if(curPathPoints.types.at(j) == "cubic"){
                        msg.type = "cubic";
                        msg.points.push_back(curPathPoints.markers.at(i).pose.position);
                        if(!curPathPoints.forBez.at(i + 1)){
                            std::cout<<"a forBez point found as goal in cubic request..\nstoping process"<<std::endl;
                            break;
                        }
                        msg.points.push_back(curPathPoints.markers.at(i + 1).pose.position);
                        if((i-1) >= 0 && !curPathPoints.forBez.at(i-1)){
                            std::cout<<"found a forBez point before start point"<<std::endl;//this means we need to calculate entrence velocities for cubic entrence
                            msg.points.push_back(curPathPoints.markers.at(i-1).pose.position);
                        }
                        if(curPathPoints.markers.size() > (i + 2) && !curPathPoints.forBez.at(i+2)){
                            std::cout<<"found a forBez point after goal point"<<std::endl;//this means we need to save exit velocities for bezier entrence
                            msg.points.push_back(curPathPoints.markers.at(i + 2).pose.position);
                            msg.hasNext = true;
                        }else{
                            std::cout<<"markers not long enough, or no forBez after goal"<<std::endl;
                            msg.hasNext = false;
                        }
                    }else if (curPathPoints.types.at(j) == "bezier"){
                        msg.type = "bezier";
                        msg.points.push_back(curPathPoints.markers.at(i).pose.position);
                        if(curPathPoints.forBez.at(i + 1)){
                            std::cout<<"a non forBez point found as p1..\nstoping process"<<std::endl;
                            break;
                        }
                        msg.points.push_back(curPathPoints.markers.at(i + 1).pose.position);
                        if(i + 2 >= curPathPoints.markers.size()){
                            std::cout<<"not enough points for bezier request..\nstopping preocess"<<std::endl;
                            break;
                        }
                        if(!curPathPoints.forBez.at(i + 2)){
                            std::cout<<"a forBez point found as p2..\nstoping process"<<std::endl;
                            break;
                        }
                        msg.points.push_back(curPathPoints.markers.at(i + 2).pose.position);
                    }else{
                        std::cout<<"found a "<<curPathPoints.types.at(j)<<" trajectory, something went wrong"<<std::endl;
                    }
                    
                    std::cout<<"sending trajectory request"<<std::endl;
                    // std::cout<<msg<<std::endl;
                    if(swapped){
                        msg.swapped = true;
                        msg.newTrajPoints = curPathPoints.points;
                        swapped = false;
                        msg.startingVels = startingVels;
                    }
                    pub_time_needed.publish(msg);
                }
            }else{
                std::cout<<"no next point, end of trajectory"<<std::endl;
            }
            break;
        }
        j++;
    }
}

void findFitness(ramp_planner_new::PathPoints& path){
    double lineTime = 0;
    double ang = 0;
    double collFact = 0;
    for(unsigned int i=0;i<path.markers.size()-1;i++){//for each line segment
        geometry_msgs::Point p1 = path.markers.at(i).pose.position;
        if(i == 0 && robot.futXY_.size() == 2){//if the first line segment and the robot has alredy started moving -> there is a future point
          // std::cout<<"FFF future: ("<<robot.futXY_.at(0)<<","<<robot.futXY_.at(1)<<") FFF"<<std::endl;
          p1.x = robot.futXY_.at(0);
          p1.y = robot.futXY_.at(1);
          path.markers.at(i).pose.position = p1;
        }else if(!path.forBez.at(i)){
          continue;
        }
        geometry_msgs::Point p2 = path.markers.at(i+1).pose.position;
        if(!path.forBez.at(i+1)){
          if(i+2 < path.markers.size()){
            p2 = path.markers.at(i+2).pose.position;
          }else{
            std::cout<<"***found forBez point in fitnessFunction, no next point to use***"<<std::endl;
          }
        }
        // std::cout<<"checking line from ("<<p1.x<<","<<p1.y<<") to ("<<p2.x<<","<<p2.y<<")"<<std::endl;
        lineTime += utility.getMinLinTime(p1,p2);//get time to get from point to point
        ang += abs(utility.findAngleFromAToB(p1,p2));//get total angular difference
        for(unsigned int j=0;j<obstacles.size();j++){//for each obstacle
            geometry_msgs::Point c = obstacles.at(j).getCenter();
            double distToLine = utility.getMinDistFromLineToPoint(p1,p2,c);//get min distance from line to obstacle
            // std::cout<<"\t\tDDD-distToLine "<<distToLine<<"\tobstRad "<<obstacles.at(j).getXradius()<<"-DDD"<<std::endl;
            double rad = obstacles.at(j).getXradius();
            if(distToLine <= rad + utility.robot_radius_){//if there will be a collision
                // std::cout<<"\t\t\twill collide with obst centered at ("<<c.x<<","<<c.y<<")"<<std::endl;
                geometry_msgs::Point colP = utility.findFirstCollision(p1,p2,c,rad);//find the first point of collision
                // std::cout<<"\tcollision with obst centered at ("<<c.x<<","<<c.y<<") at \t("<<colP.x<<","<<colP.y<<")"<<std::endl;
                double colDist = utility.getMinLinTime(p1,colP);//get time to first point of collision
                // std::cout<<"\t\tdist to collision: "<<colDist<<std::endl;
                collFact += 100000/colDist;
            }
        }
    }
    path.fitness = 100/(lineTime*.4 + ang*.3 + collFact*.3);
}

void pickBestPath(){
    if(evaluate){
        evaluate = false;
        // std::cout<<"evaluating "<<pathPointsPopulation.size()<<" paths"<<std::endl;
        for(unsigned int i=0;i<pathPointsPopulation.size();i++){//for each path
            // std::cout<<"finding fitness for path id "<<pathPointsPopulation.at(i).id<<std::endl;
            findFitness(pathPointsPopulation.at(i));//find fitness
            std::cout<<"\t$$fitness of path "<<pathPointsPopulation.at(i).id<<" is "<<pathPointsPopulation.at(i).fitness<<"$$"<<std::endl;
        }
        std::sort(pathPointsPopulation.begin(), pathPointsPopulation.end(),//sort all paths by fitness
        [](const ramp_planner_new::PathPoints &x, const ramp_planner_new::PathPoints &y) {
            return x.fitness < y.fitness;
        });
    }
    int pastPathId = curPathPoints.id;
    curPathPoints = pathPointsPopulation.back();//set the current path to be the most fit
    if(curPathPoints.id != pastPathId){
        swapped = true;
        std::cout<<"\t\t---##swapped based on id##---"<<std::endl;
    }
    if(curStartId == -1 || swapped){
        curStartId = curPathPoints.markers.at(0).id;
    }
    std::cout<<"---curPath ("<<curPathPoints.id<<") has "<<curPathPoints.markers.size()<<" path points---"<<std::endl;
    if(swapped || gettingNext){
      gettingNext = false;
      updateStartGoal();
    }
}

//callback for points belonging to a single trajectory
void pathPointCallback(const ramp_planner_new::PathPoints pp){
    std::cout<<"---path has "<<pp.markers.size()<<" points with id "<<pp.id<<"---"<<std::endl;
    pathPointsPopulation.push_back(pp);
    if(pp.id == 0){//new path
        maxPathId++;
        pathPointsPopulation.back().id = maxPathId;
    }else{//replace old path with the same id (after being bezified)
        for(unsigned int i=0;i<pathPointsPopulation.size();i++){
            if(pathPointsPopulation.at(i).id == pp.id){
                pathPointsPopulation.erase(pathPointsPopulation.begin() + i);
                break;
            }
        }
        gettingNext = true;
        pickBestPath();
    }
}

//callback for a population of trajectories
void pathPointsCallback(const ramp_planner_new::Population pathPop){
    std::cout<<"\t++have "<<pathPop.paths.size()<<" paths++"<<std::endl;
    for(unsigned int i=0;i<pathPop.paths.size();i++){
        pathPointCallback(pathPop.paths.at(i));
    }
    pickBestPath();
}

void getNextPoint(){
    curStartId += 1;//increment knot point id
    gettingNext = true;
    updateStartGoal();
}

void swapTrajectory(const ramp_planner_new::SwapRequest msg){
//   pathPointsPopulation.clear();
  std::cout<<"##swapping trajectory##"<<std::endl;
  std::cout<<"\tstarting vels: ("<<msg.curLinVels.at(0)<<","<<msg.curLinVels.at(1)<<")"<<std::endl;
  startingVels.push_back(msg.curLinVels.at(0));
  startingVels.push_back(msg.curLinVels.at(1));
  ramp_planner_new::PathPoints pps;
  geometry_msgs::Point p;
  p.x = msg.prevPositions.at(0);
  p.y = msg.prevPositions.at(1);
  pps.points.push_back(p);
  p.x = msg.curPositions.at(0);
  p.y = msg.curPositions.at(1);
  pps.points.push_back(p);
  p.x = 2.75;
  p.y = 1;
  pps.points.push_back(p);
  p.x = 2.5;
  p.y = 3.5;
  pps.points.push_back(p);
  //TODO get add path points to swap to

  // markers for both positions
  for(unsigned int i=0;i<pps.points.size();i++){
    visualization_msgs::Marker marker;
    marker.header.stamp = ros::Time::now();
    if(i==0){
      marker.id = 10001;
    } else {
      marker.id = 10001 + i;
    }
    marker.header.frame_id = "map";//TODO make this dynamic if needed?
    marker.ns = "basic_shapes";
    marker.type = visualization_msgs::Marker::SPHERE;
    marker.action = visualization_msgs::Marker::ADD;
    // set positions
    marker.pose.position.x = pps.points.at(i).x;
    marker.pose.position.y = pps.points.at(i).y;
    marker.pose.position.z = 0.0;
    // set orientations
    marker.pose.orientation.x = 0.0;
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 1.0;
    // set radii
    marker.scale.x = 0.1;
    marker.scale.y = 0.1;
    marker.scale.z = 0.1;
    // set colors
    marker.color.r = 1;
    marker.color.g = 0;
    marker.color.b = 0;
    marker.color.a = 1;
    // set lifetimes
    marker.lifetime = ros::Duration(120.0);

    pps.markers.push_back(marker);
  }
//   std::cout<<"swapped pps.markers.size:"<<pps.markers.size()<<std::endl;

  for(unsigned int i=0;i<pps.markers.size()-1;i++){//populate type and forBez arrays
    pps.types.push_back("cubic");
    pps.forBez.push_back(true);
  }
  pps.forBez.push_back(true);//extra value needed not included above  
  
//   std::cout<<"swapped pps.types.size:"<<pps.types.size()<<std::endl;
//   std::cout<<"swapped pps.forBez.size:"<<pps.forBez.size()<<std::endl;
  maxPathId++;
  pps.id = maxPathId;
  pathPointsPopulation.push_back(pps);
  
  swapped = true;
  pickBestPath();
}

//callback for a population of obstacles -> resets list on every call
void obstacleCallback(const ramp_planner_new::ObstacleList msg){
    gotObs = true;
    std::cout<<"---obstacle list has "<<msg.obstacles.size()<<" obstacles"<<"---"<<std::endl;
    obstacles.clear();
    for(unsigned int i=0;i<msg.obstacles.size();i++){
        Obstacle obs(msg.obstacles.at(i));
        obstacles.push_back(obs);
        if(obs.id_ == 0){//new path
            maxObsId++;
            obstacles.back().id_ = maxObsId;
        }//else{
        //     TODO needed?
        // }
    }
    evaluate = true;
    pickBestPath();
}


void trajCallback(const ramp_planner_new::TrajectoryRepresentation traj){
  robot.updateTrajectory(traj);
}

int main(int argc, char** argv) {
  std::cout<<"\nstarting controler\n";
  srand( time(0));

  ros::init(argc, argv, "ramp_controller_new");
  ros::NodeHandle handle;
  // ros::NodeHandle handle_local("~");

  ros::Subscriber trajListener  = handle.subscribe("coef_channel", 1, trajCallback);

  ros::Subscriber pathPointsListener  = handle.subscribe("/path_points_channel", 1, pathPointsCallback);
  ros::Subscriber obstacleListener = handle.subscribe("obstacle_channel",1,obstacleCallback);
  ros::Subscriber singlePathPointsListener  = handle.subscribe("/single_path_points_channel", 1, pathPointCallback);
  pub_path_points = handle.advertise<visualization_msgs::MarkerArray>("/start_goal_channel",10);
  pub_time_needed = handle.advertise<ramp_planner_new::TrajectoryRequest>("/traj_req",1);
  pub_bezify_request = handle.advertise<ramp_planner_new::BezifyRequest>("/bezify_request",1);

  setvbuf(stdout, NULL, _IOLBF, 4096);

  bool sim = true;

  init_advertisers_subscribers(robot,handle,sim);

  ros::Rate r(1000);
  while(ros::ok()) 
  {
    robot.moveOnTrajectory();
    if(robot.readyNext_){
      robot.readyNext_ = false;
      getNextPoint();
    }
    if(robot.swap_traj_.curPositions.size() != 0){//if robot wants to swap trajectories
      swapTrajectory(robot.swap_traj_);
      robot.swap_traj_.curPositions.clear();
      robot.swap_traj_.curLinVels.clear();
      robot.swap_traj_.prevPositions.clear();
    }
    r.sleep();
    ros::spinOnce();
  }

  fflush(stdout);

  std::cout<<"\nExiting Mover Normally\n";
  return 0;
}
