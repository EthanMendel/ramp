#ifndef PATH_H
#define PATH_H
#include "knot_point.h"
#include "ramp_msgs/Path.h"
#include "ramp_planner_new/CubicRepresentation.h"
#include <std_msgs/Int8.h>

class Path {
  public:

    Path();
    Path(const KnotPoint start, const KnotPoint goal);
    Path(const MotionState start, const MotionState goal);
    Path(const std::vector<KnotPoint> all);
    Path(const std::vector<MotionState> all);
    Path(const ramp_msgs::Path p);
    ~Path();
    
    // Data members
    KnotPoint start_;
    KnotPoint goal_;

    unsigned int order;
    std::vector<std::vector<double>> coefs;
    double usedT_;

    ramp_msgs::Path msg_;

    Utility utility_;
    
    
    // Methods
    const bool equals(const Path& p, const double& epsilon=0.1) const;
    const KnotPoint at(const uint8_t i) const;
    void addBeforeGoal(const KnotPoint kp);
    void addBeforeGoal(const MotionState kp);
    void changeStart(const MotionState ms);
    void offsetPositions(const MotionState diff);
    const unsigned int size() const;
    const ramp_msgs::Path buildPathMsg() const; 
    const ramp_planner_new::CubicRepresentation buildCubicMsg() const;
    const std::string toString() const;
    void findLinearCoefs();
    void makeStraightPath();
    void findCubicCoefs(const double T);
    void makeCubicPath(const double T);
    void findBezierCoefs(const ramp_msgs::KnotPoint p0, const ramp_msgs::KnotPoint p1, const ramp_msgs::KnotPoint p2);
    void makeBezierPath(const double T);
};

#endif
