#include "ros/ros.h"
#include "visualization_msgs/MarkerArray.h"
#include <std_msgs/Bool.h>
#include <geometry_msgs/Pose.h>
#include <ramp_planner_new/TrajectoryRequest.h>
#include <ramp_planner_new/PathPoints.h>

ramp_planner_new::PathPoints pathPoints;
int curStartId = -1;
visualization_msgs::MarkerArray curStartGoal;
ros::Publisher pub_path_points;
ros::Publisher pub_time_needed;
double max_linear_vel = 0.33;
double max_angular_vel = 1.5708;

//assuming straight line path from start to goal
void getMinLinTime(const geometry_msgs::Point& start, const geometry_msgs::Point goal){
  double sx = start.x;
  double sy = start.y;
  double gx = goal.x;
  double gy = goal.y;

  double dist = sqrt(pow(sx-gx,2)+pow(sy-gy,2));
  double time_needed = ceil(dist/max_linear_vel);
  ramp_planner_new::TrajectoryRequest msg;
  msg.timeNeeded = time_needed;
  msg.type = "cubic";
  msg.points.push_back(start);
  msg.points.push_back(goal);
  std::cout<<"Trajectory Request:\n"<<msg<<std::endl;
  pub_time_needed.publish(msg);
}

bool acceptableAngTime(const geometry_msgs::Point& p0, const geometry_msgs::Point p1, const geometry_msgs::Point p2){
    const double resolution = 1/10.0;
    std::vector<std::vector<double>> coefs;
    std::vector<double> hold;
    hold.push_back(p1.x);
    hold.push_back(p0.x - p1.x);//because of chain rule, multipley by -1 for first derivative
    hold.push_back(p2.x - p1.x);
    coefs.push_back(hold);
    hold.clear();
    hold.push_back(p1.y);
    hold.push_back(p0.y - p1.y);//because of chain rule, multipley by -1 for first derivative
    hold.push_back(p2.y - p1.y);
    coefs.push_back(hold);
    hold.clear();
    hold.push_back(p1.z);
    hold.push_back(p0.z - p1.z);//because of chain rule, multipley by -1 for first derivative
    hold.push_back(p2.z - p1.z);
    coefs.push_back(hold);
    hold.clear();

    for(float t=0;t<=1;t+=resolution){
        for(unsigned int j=0;j<3;j++){//3=DOF
            //not sure if this is the right calculation for angular velocity
            double vel =(-2*(1-t)*(coefs.at(j).at(1))) + (2*t*(coefs.at(j).at(2)));        
            if(vel > max_angular_vel){
                return false;
            }
        }
    }
    return true;
}


void updateStartGoal(){
    curStartGoal.markers.clear();
    for(unsigned int i=0;i<pathPoints.markers.size();i++){
        if(pathPoints.markers.at(i).id == curStartId){
            curStartGoal.markers.push_back(pathPoints.markers.at(i));
            curStartGoal.markers.push_back(pathPoints.markers.at(i+1));
            getMinLinTime(pathPoints.markers.at(i).pose.position,pathPoints.markers.at(i+1).pose.position);
            break;
        }
    }
}

visualization_msgs::Marker makeMarker(geometry_msgs::Point p, int id){
    visualization_msgs::Marker marker;
    marker.header.stamp = ros::Time::now();
    marker.id = id;
    
    marker.header.frame_id = "map";
    marker.ns = "basic_shapes";
    marker.type = visualization_msgs::Marker::SPHERE;
    marker.action = visualization_msgs::Marker::ADD;
    // set positions
    marker.pose.position.x = p.x;
    marker.pose.position.y = p.y;
    marker.pose.position.z = 0.01;
    // set orientations
    marker.pose.orientation.x = 0.0;
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 1.0;
    // set radii
    marker.scale.x = 0.5;
    marker.scale.y = 0.5;
    marker.scale.z = 0.1;
    // set colors
    marker.color.r = 1;
    marker.color.g = 0;
    marker.color.b = 0;
    marker.color.a = 1;
    // set lifetimes
    marker.lifetime = ros::Duration(120.0);

    return marker;
}

ramp_planner_new::PathPoints addControlPoints(visualization_msgs::Marker m, geometry_msgs::Point cp1, geometry_msgs::Point cp2){
    visualization_msgs::MarkerArray maRes;
    std::vector<std::string> tRes;
    int replaceId = -1;
    bool replaced = false;
    for(unsigned int i=0;i<pathPoints.markers.size();i++){
        if(!replaced){
            if(pathPoints.markers.at(i) == m){
                replaceId = m.id - i;
                maRes.markers.push_back(makeMarker(cp1,replaceId + i));
                maRes.markers.push_back(makeMarker(cp2,replaceId + i + 1));
                tRes.push_back("bezier");
                tRes.push_back(pathPoints.types.at(i));
                replaced = true;
            }else{
                maRes.markers.push_back(pathPoints.markers.at(i));
                tRes.push_back(pathPoints.types.at(i));
            }
        }else{
            pathPoints.markers.at(i).id = replaceId + i + 1;
            maRes.markers.push_back(pathPoints.markers.at(i));
            if(i < pathPoints.types.size()){
                tRes.push_back(pathPoints.types.at(i));
            }
        }
    }
    ramp_planner_new::PathPoints result;
    result.markers = maRes.markers;
    result.types = tRes;
    return result;
}

void pathPointsCallback(const visualization_msgs::MarkerArray ma){
    std::cout<<"\n-----got all path points-----"<<std::endl;
    pathPoints.markers = ma.markers;
    for(unsigned int i=0;i<pathPoints.markers.size()-1;i++){
        pathPoints.types.push_back("cubic");
    }
    if(curStartId == -1){
        curStartId = ma.markers.at(0).id;
    }
    if(pathPoints.markers.size() > 2){
        visualization_msgs::Marker m0,m1,m2;
        for(unsigned int i=0;i<pathPoints.markers.size();i++){
            if(pathPoints.markers.at(i).id == curStartId){
                m0 = pathPoints.markers.at(i);
                m1 = pathPoints.markers.at(i + 1);
                m2 = pathPoints.markers.at(i + 2);
                break;
            }
        }
        geometry_msgs::Point p0,p1,p2;
        p0 = m0.pose.position;
        p1 = m1.pose.position;
        p2 = m2.pose.position;
        double D1 = sqrt(pow(p0.x - p1.x,2) + pow(p0.y - p1.y,2));
        double D2 = sqrt(pow(p1.x - p2.x,2) + pow(p1.y - p2.y,2));
        double D = std::min(D1,D2);

        double v1[] = {p1.x - p0.x, p1.y - p0.y};
        double normFactor1 = sqrt(pow(v1[0],2) + pow(v1[1],2));
        double u1[] = {v1[0]/normFactor1, v1[1]/normFactor1};
        double v2[] = {p2.x - p1.x, p2.y - p1.y};
        double normFactor2 = sqrt(pow(v2[0],2) + pow(v2[0],2));
        double u2[] = {v2[0]/normFactor2, v2[1]/normFactor2};
        //find new control points
        geometry_msgs::Point cp1,cp2;
        for(float d=.1;d<=D;d+=.1){
            cp1.x = p1.x - d*u1[0];
            cp1.y = p1.y - d*u1[1];
            cp2.x = p1.x + d*u2[0];
            cp2.y = p1.y + d*u2[1];
            curStartGoal.markers.clear();
            //find bezier based on control and test if its okay
            if(acceptableAngTime(cp1,p1,cp2)){
                break;
            }
        }
        std::cout<<"**found good bezier**"<<std::endl;
        pathPoints = addControlPoints(m1,cp1,cp2);
    }
    updateStartGoal();
}

void getNextPoint(const std_msgs::Bool b){
    curStartId += 1;
    updateStartGoal();
}

int main(int argc, char** argv) {
  std::cout<<"\nstarting listener\n";
  srand( time(0));

  ros::init(argc, argv, "ramp_control_buffer");
  ros::NodeHandle handle;
  ros::NodeHandle handle_local("~");

  ros::Subscriber pathPointsListener  = handle.subscribe("path_points_channel", 1, pathPointsCallback);
  ros::Subscriber readyNextListener = handle.subscribe("ready_next", 1, getNextPoint);
  pub_path_points = handle.advertise<visualization_msgs::MarkerArray>("start_goal_channel",10);
  pub_time_needed = handle.advertise<ramp_planner_new::TrajectoryRequest>("/time_needed",1);
  setvbuf(stdout, NULL, _IOLBF, 4096);

  ros::Rate r(1000);
  while(ros::ok()) 
  {
    r.sleep();
    ros::spinOnce();
  }

  fflush(stdout);

  std::cout<<"\nExiting Normally\n";
  return 0;
}
