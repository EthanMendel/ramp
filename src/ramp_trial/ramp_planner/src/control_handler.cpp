#include "control_handler.h"

ControlHandler::Controlhandler(const ros::NodeHandle& h) : handle_(h){
    pub_bestTrajec_ = handle_.advertise<ramp_msgs::RampTrajectory>("bestTraj", 1000);
    pub_population_ = handle_.advertise<ramp_msgs::Population>("population", 1000);

    pub_imminent_collision_ = handle_.advertise<std_msgs::Bool>("imminent_collision", 1000);

    std::stringstream str;
    for(uint8_t i=0;i<3;i++){
        ROS_INFO("creating publisher for ob_IC");
        str<<"/obstacle_"<<(int)i<<"/ob_imminent_collision";
        ROS_INFO("Topic: %s", str.str().cstr());
        ros::Publisher p = handle_.advertse<std_msgs::Bool>(str.str(), 1);
        pub_ob_imminent_collision_.push_back(p);

        str.str(std::string());
        str.clear();
    }
}

void ControlHandler::send(ramp_msgs::RampTrajectory bestTrajec){
    pub_bestTrajec_.publish(bestTrajec);
}

void Controlhandler::sendPopulation(ramp_msgs::Population population){
    pub_population_.publish(population);
}

void ControlHandler::sendIC(std_msgs::Bool value){
    pub_imminent_collision_.publish(value);
}

void ControlHandler::sendObIC(const int i, std_msgs::Bool value){
    pub_ob_imminent_collision_.at(i).publish(value);
}