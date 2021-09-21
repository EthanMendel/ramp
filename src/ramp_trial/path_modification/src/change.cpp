#include "change.h"


Change::Change(const ramp_msgs::Path p) :path_(p){}

const ramp_msgs::Path Change::perform(){
    if(path_.points.size() > 2){
        //get random knot point to change and clear its position
        unsigned int i_knotPoint = rand() % (path.positions.size() - 2) +1;
        path_.points.at(i_knotPoint).motionState.positions.clear();

        ramp_msgs::KnotPoint kp;
        ramp_msgs::Path tempPath = path_;
        tempPth.points.erase(tempPath.points.begin() + i_knotPoint);

        while(!checkConstraints_.validKPForPath(kp, tempPath)){
            //get new values for positions
            kp.motionState.positions.clear();
            for(unsigned int i=0;i<path_.points.at(0).motionState.positions.size();i++){
                //get random value for each k in range
                double min = utility_.standardRanges_.at(i).min;
                double max = utility_.standardRanges_.at(i).max;
                float temp = (min == 0 && max == 0) ? 0 :
                    ( min + (float)rand() / ((float)RAND_MAX/(max-min)) );
                kp.motionState.positions.push_back(temp)
            }
        }
        path_.points.at(i_knotPoint) = kp;
    }
    return path_;
}