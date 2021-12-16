#ifndef PATH_H
#define PATH_H
#include "knot_point.h"
#include "ramp_msgs/Path.h"
#include "ramp_planner_new/TrajectoryRepresentation.h"
#include "ramp_planner_new/TrajectoryRequest.h"
#include "ramp_planner_new/PathPoints.h"

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
    std::vector<std::vector<double>> uCoefs;
    std::string type;
    double usedT_;
    double usedTdelta_;
    double startT_;
    std::vector<double> uCubicEntrenceVelocities;

    ramp_msgs::Path msg_;

    Utility utility;
    
    
    // Methods
    const bool equals(const Path& p, const double& epsilon=0.1) const;
    void setUsedT(const double T);
    const KnotPoint at(const uint8_t i) const;
    void addBeforeGoal(const KnotPoint kp);
    void addBeforeGoal(const MotionState kp);
    void addBefore(const KnotPoint kp, const KnotPoint b);
    void addBefore(const MotionState ms, const MotionState bms);
    void changeStart(const MotionState ms);
    void offsetPositions(const MotionState diff);
    const unsigned int size() const;
    const ramp_msgs::Path buildPathMsg() const; 
    const ramp_planner_new::TrajectoryRepresentation buildCubicMsg() const;
    const std::string toString() const;
    void findLinearCoefs();
    void makeStraightPath();
    void findCubicCoefs(const ramp_planner_new::TrajectoryRequest msg);
    void makeCubicPath(const ramp_planner_new::TrajectoryRequest msg);
    void findBezierCoefs(geometry_msgs::Point p0, geometry_msgs::Point p1, geometry_msgs::Point p2);
    void makeBezierPath(const ramp_planner_new::TrajectoryRequest msg);
    void setPathPoints(const ramp_planner_new::PathPoints pp);
};

#endif
