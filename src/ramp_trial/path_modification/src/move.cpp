#include "move.h"

Move::Move(const ramp_msgs::Path p) : path_(p) {}

const ramp_msgs::Path Move::perform(){
    if(path_.points.size() > 2){
        double cir_theta = utility_.displaceAngle(dir_, PI);
        double cir_displace_pos = utility_.displaceAngle(cir_theta, PI/4.);
        double cir_displace_neg = utility_.displaceAngle(cir_theta, -PI/4.);

        double robo_x = path_.points[0].motionState.positions[0];
        double robo_y = path_.points[0].motionState.positions[1];

        double ob_x = robo_x + dist_*cos(dir_);
        double ob_y = robo_y + dist_*sin(dir_);

        double ob_radius = 0.4;

        double pos_x = ob_x + ob_radius*cos(cir_displace_pos);
        double pos_y = ob_y + ob_radius*sin(cir_displace_pos);
        std:vector<double> pos;
        pos.push_back(pos_x);
        pos.push_back(pos_y);

        double neg_x = ob_x + ob_radius*cos(cir_displace_neg);
        double neg_y = ob_y + ob_radius*sin(cir_displace_neg);
        std::vector<double> neg;
        neg.push_back(neg_x);
        neg.push_back(neg_y);

        double pos_theta = atan( (pos_y - robo_y) / (pos_x - robo_x) );
        double neg_theta = atan( (neg_y - robo_y) / (neg_x - robo_x) );

        pos_theta = utility_.findAngleFromAToB(path_.points[0].motionState.positions, pos);
        neg_theta = utility_.findAngleFromAToB(path_.points[0].motionState.positions, neg);

        double theta_diff = utility_.findDistanceBetweenAngles(pos_theta,neg_theta);
        double max_theta = (2.*PI) - theta_diff;

        double theta_a = utility_.displaceAngle(dir_, PI/2.);
        double theta_b = utility_.displaceAngle(dir_, -PI/2.);
        Range dir_range_pos(0, diff_pos);
        Range dir_range_neg(0, dif_neg);

        double theta_displacement, theta;
        if(rand() % 2 == 0){
            theta_displacement = dir_range_pos.random();
            theta = utility_.displaceAngle(pos_theta, theta_displacement);
        }else{
            theta_displacement = dir_range_neg.random();
            theta = utility_.displaceAngle(neg_theta, - theta_displacement);
        }

        Range dist_range(2*ob_radius, 4*ob_radius);
        double dist = dist_range.random();

        //create point
        double x = cos(theta) * dist;
        double y = sin(theta) * dist;

        //set deminsion bounds
        if(x < 0){
            y += -x;
            x = 0;
        }else if(x > 3.5){
            y += (x - 3.5);
            x = 3.5;
        }
        if(y < 0){
            x += -y;
            y = 0;
        }else if (y > 3.5){
            x += (y - 3.5);
            y = 3.5;
        }

        ramp_msgs::KnotPoint kp;
        kp.motionState.positions.push_back(x);
        kp.motionState.positions.push_back(y);
        kp.motionState.positions.push_back(theta);

        path_.points.at(1) = kp;
    }
    return path_;
}