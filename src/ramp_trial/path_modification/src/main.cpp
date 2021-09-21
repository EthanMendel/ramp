#include "ros/ros.h"
#include "ramp_msgs/Range.h"
#include "utility.h"
#include "modifier.h"

Utility u;

bool handleRequest(ramp_msgs::ModificationRequest::Request & req,
                   ramp_msgs::ModificationRequest::Response& res){
    Modifier mod(req);
    res.mod_path = mod.perform();

    return true;
}

int main(int argc, char** argv){
    ros::init(argc, argv, "path_modification");
    srand(time(0));

    ros:NodeHandle handle;
    ros::ServiceServer service = handle.advertiseService("path_modification", handleRequest);

    Utility u;

    ramp_msgs::Path p1;
    for(unsigned int i=0;i<10;i++){
        ramp_msgs::KnotPoint kp;
        kp.motionState.positions.push_back(i);
        kp.motionState.positions.push_back(i+1);
        kp.motionState.positions.push_back(i+2);

        p1.points.push_back(kp);
    }
    ROS_INFO("Path before modification: %s", u.toString(p1).c_str());

    Move m(p1);
    m.dir_ = PI/4;
    m.dist_ = 1;
    m.perform;

    ROS_INFO("Path after modification: %s", u.toString(p1).c_str));

    std::cout<<"\nSpinning..\n";
    ros::spin();
    std::cout<<"\nExiting Normally\n";
    return 0;
}