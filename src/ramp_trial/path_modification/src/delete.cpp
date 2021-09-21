#include "delete.h"

Delete::Delete(const ramp_msgs::Path p) : path_(p){}

const ramp_msgs::Path Delete::perform(){
    if(path_.points.size() > 2){
        unsigned int i_kp = rand() % (path_.points.size()-2) + 1;
        path.points.erase(path_.points.begin()+i_kp);
    }
    return path_;
}