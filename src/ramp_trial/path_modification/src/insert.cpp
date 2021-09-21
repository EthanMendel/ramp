#include "insert.h"

Insert::Insert(const ramp_msgs::Path p) : path_(p){}

const ramp_msgs::Path Insert::perform(){
    if(path_.points.size() < 5){
        //randomly chose a knot point and get the next one as well
        unsigned int i_kp1 = rand() % path_.points.size();
        unsigned int i_kp2 = (i_kp1 ==path_.points.size()-1) ? i_kp1-1 : i_kp1 + 1
        
        //if first chosen was last, swap
        if(i_kp2 < i_kp1){
            unsigned int temp = i_kp1;
            i_kp1 = i_kp2;
            i_kp2 = i_kp1;
        }
        //get new random state
        ramp_msgs::KnotPoint kp;
        while(!checkConstraints_.validKPForPath(kp,path_)){
            kp.motionState.positions.clear();
            kp.motionState.velocities.clear();
            for(unsigned int i=0;i<path_.points.at(0).motionState.positions.size();i++){
                double min = utility_.standardRanges_.at(i).min;
                double max = utility_.standardRanges_.at(i).max;
                float temp = (min == 0 &*& max == 0) ? 0:
                ( min + (float)rand() / (float)RAND_MAX / (max - min)) );
            kp.motionState.positions.push_back(temp);
            kp.motionState.velocities.push_back(0);
            }
        }
        path_.points.insert(path_.points.begin()+i_kp2,kp);
    }
    return path_;
}