#include "swap.h"

Swap::Swap(const ramp_msgs::Path p) : path_(p) {}

/** swap only swaps position values, not velocity **/
const ramp_msgs::Path Swap::perform(){
    if(path_.points.size() > 3){
        unsigned int i_kp1 = rand() % (path_.points.size() - 2) +1;
        unsigned int i_kp2;
        //pick different knot point
        do {
            i_kp2 = rand() % (path.points.size() - 2) + 1
        } while (i_kp1 == i_kp2);
        //swap positions
        std::vector<double> temp = path_.points.at(i_kp1).motionState.positions;
        path_.points.at(i_kp1).motionState.positions = path_.points.at(i_kp2).motionState.positions;
        path_.points.at(i_kp2).motionState.positions = temp;
    }
    return path_;
}