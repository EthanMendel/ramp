#include "obstacle.h"

Obstacle::Obstacle(std::vector<std::vector<float>> bounds) {
    //NOTE: when making a square/rectangle, 
    //      ->always add bound counter-clockwise 
    //        starting at the bottom left corner
    for(unsigned int i=0;i<bounds.size();i++){
        std::vector<double> b;
        for(unsigned int j=0;j<bounds.at(i).size();j++){
            b.push_back(bounds.at(i).at(j));
        }
        bounds_.push_back(b);
    }
    numBounds_ = bounds_.size();
    Utility u;
    utility_ = u;
    id_ = 0;
}

Obstacle::Obstacle(ramp_planner_new::Obstacle obs){
    for(unsigned int i=0;i<obs.bounds.size();i++){
        std::vector<double> b;
        b.push_back(obs.bounds.at(i).x);
        b.push_back(obs.bounds.at(i).y);
        b.push_back(obs.bounds.at(i).z);
        bounds_.push_back(b);
    }
    numBounds_ = bounds_.size();
    Utility u;
    utility_ = u;
    id_=0;
}

Obstacle::~Obstacle() {}

void Obstacle::setId(int id){
    id_ = id;
}

visualization_msgs::Marker Obstacle::getMarker(std::string global_frame, int id){
    visualization_msgs::Marker marker;
    marker.header.stamp = ros::Time::now();
    marker.id = id;

    marker.header.frame_id = global_frame;
    marker.ns = "basic_shapes";
    if(numBounds_ == 3){
        marker.type = visualization_msgs::Marker::TRIANGLE_LIST;
        // first point to create line start
        geometry_msgs::Point p;
        p.x = bounds_.at(0).at(0);
        p.y = bounds_.at(0).at(1);
        p.z = bounds_.at(0).at(2);
        marker.points.push_back(p);
        p.x = bounds_.at(1).at(0);
        p.y = bounds_.at(1).at(1);
        p.z = bounds_.at(1).at(2);
        marker.points.push_back(p);
        p.x = bounds_.at(2).at(0);
        p.y = bounds_.at(2).at(1);
        p.z = bounds_.at(2).at(2);
        marker.points.push_back(p);
    }else if(numBounds_ == 2){
        marker.type = visualization_msgs::Marker::SPHERE;
        // set positions
        marker.pose.position.x = bounds_.at(0).at(0);
        marker.pose.position.y = bounds_.at(0).at(1);
        marker.pose.position.z = bounds_.at(0).at(2);
        // set radii
        marker.scale.x = bounds_.at(1).at(0);
        marker.scale.y = bounds_.at(1).at(1);
        marker.scale.z = bounds_.at(1).at(2);
    }else if(numBounds_ == 4){
        marker.type = visualization_msgs::Marker::CUBE;
        // set positions
        marker.pose.position.x = (bounds_.at(0).at(0)+bounds_.at(2).at(0))/2;
        marker.pose.position.y = (bounds_.at(0).at(1)+bounds_.at(2).at(1))/2;
        marker.pose.position.z = (bounds_.at(0).at(2)+bounds_.at(2).at(2))/2;
        // set radii
        marker.scale.x = utility_.positionDistance(bounds_.at(0),bounds_.at(3));
        marker.scale.y = utility_.positionDistance(bounds_.at(0),bounds_.at(1));
        marker.scale.z = 0.1;
    }else{
        std::cout<<"MORE THAN 4 BOUNDING POINTS FOR OBSTACLE"<<std::endl;
    }

    marker.pose.orientation.x = 0.0;
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 1.0;

    marker.action = visualization_msgs::Marker::ADD;
    // set colors
    marker.color.r = 1;
    marker.color.g = 1;
    marker.color.b = 1;
    marker.color.a = 1;
    // set lifetimes
    marker.lifetime = ros::Duration(120.0);

    return marker;
}

ramp_planner_new::Obstacle Obstacle::getMsg(){
    ramp_planner_new::Obstacle obs;
    for(unsigned int i=0;i<bounds_.size();i++){
        geometry_msgs::Point p;
        p.x = bounds_.at(i).at(0);
        p.y = bounds_.at(i).at(1);
        p.z = bounds_.at(i).at(2);
        obs.bounds.push_back(p);
    }
    obs.id = 0;
    return obs;
}

geometry_msgs::Point Obstacle::getCenter(){
    geometry_msgs::Point center;
    center.x = bounds_.at(0).at(0);
    center.y = bounds_.at(0).at(1);
    center.z = bounds_.at(0).at(2);
    return center;
}

double Obstacle::getXradius(){
    return bounds_.at(1).at(0);
}