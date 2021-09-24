/****************************************************************************
**
** Copyright (C) 2010 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Nokia Corporation and its Subsidiary(-ies) nor
**     the names of its contributors may be used to endorse or promote
**     products derived from this software without specific prior written
**     permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
** $QT_END_LICENSE$
**
****************************************************************************/

#include "TrajectoryView.h"

#include <math.h>
#include <QtGui>
#include <stdio.h>

TrajectoryView::TrajectoryView(QWidget *parent) : QGraphicsView(parent){
    width_ = 540;
    height_ = 540;
    maxWidthMeters_ = 2.5f;
    maxHeightMeters_ = 10.f;

    // setup the scene
    QGraphicsScene *scene = new QGraphicsScene(this);
    scene->setItemIndexMethod(QGraphicsScene::NoIndex);
    scene->setSceneRect(0, 0, width_, height_);

    setScene(scene);
    setCacheMode(CacheBackground);
    setViewportUpdateMode(BoundingRectViewportUpdate);
    setRenderHint(QPainter::Antialiasing);
    setTransformationAnchor(AnchorUnderMouse);
    setWindowTitle(tr("Trajectory View"));
}

// change scene size to updated one when user resizes the window
void TrajectoryView::size_changed(){
    width_ = this->parentWidget()->frameSize().width();
    height_ = this->parentWidget()->frameSize().height();

    this->resize(width_, height_);
}

void TrajectoryView::size_changed_manual(){
    this->resize(width_, height_);
    this->scene()->setSceneRect(0, -height_, width_ - 10, height_ - 10); // We need to make the scene a little smaller than the frame
}

// update population and called drawing function
void TrajectoryView::population(const ramp_msgs::Population &msg){

    populations_.clear();
    populations_.push_back(msg);

    drawPopulation();
}

/** draw population of trajectories */
void TrajectoryView::drawPopulation(){

    // clear scene
    this->scene()->clear();

    // iinitialize a QPen object
    QPen pen = QPen(QColor(0, 0, 0, 150));
    QPen pen1 = QPen(QColor(0, 255, 0, 150));
    QPen pen2 = QPen(QColor(0, 0, 255, 150));

    // Horizontal lines
    for (int i = 0; i <= maxHeightMeters_; i++){
        this->scene()->addLine(0, metersToPixels(i + 0.1, false), width_ - 10, metersToPixels(i + 0.1, false), pen);
    }
    // Vertical lines
    for (int i = 0; i <= maxWidthMeters_; i++){
        this->scene()->addLine(metersToPixels(i, true), 0, metersToPixels(i, true), metersToPixels(height_ - 10, false), pen);
    }

    ROS_INFO("maxWidthMeters_: %f ceil(maxWidthMeters_): %f", maxWidthMeters_, ceil(maxWidthMeters_));

    // if maxWidthMeters_ is not an integer, draw the last line
    if (ceil(maxWidthMeters_) != maxWidthMeters_){
        ROS_INFO("Drawing last line");
        this->scene()->addLine(metersToPixels(maxWidthMeters_, true), 0, metersToPixels(maxWidthMeters_, true), metersToPixels(height_ - 10, false), pen);
    }

    width_ = (height_ * 3.f) / 10.f;
    size_changed_manual();

    double radius = 0.5;
    int radiusPixels = metersToPixels(radius, true);

    QPen penTraj;
    // for each population
    for (unsigned int p = 0; p < populations_.size(); p++){

        // set i to the index of the best trajectory
        int i = populations_.at(p).best_id;

        // for each trajectory in the population
        for (unsigned int t = 0; t < populations_.at(p).population.size(); t++){

            // get the points for that trajectory
            std::vector<trajectory_msgs::JointTrajectoryPoint> points = populations_.at(p).population.at(t).trajectory.points;
            // if movingOn, set to black
            if (t == populations_.at(p).population.size() - 1){
                penTraj = QPen(QColor(0, 0, 0, 255));
            }
            // green for robot 1 and feasible
            else if (populations_.at(p).robot_id == 0 && populations_.at(p).population.at(t).feasible){
                penTraj = QPen(QColor(0, 255, 0, 255));
            }
            // blue for robot 2 and feasible
            else if (populations_.at(p).robot_id == 1 && populations_.at(p).population.at(t).feasible){
                penTraj = QPen(QColor(0, 0, 255, 255));
            }
            // else, if either are in collision, red
            else{
                penTraj = QPen(QColor(255, 0, 0, 150));
            }
            // if the best trajectory (and not in collision), set to blue
            if (t == i && populations_.at(p).population.at(t).feasible){
                penTraj = QPen(QColor(0, 0, 255, 255));
            }

            if (points.size() == 1){
                std::vector<float> p;
                p.push_back(points.at(0).positions.at(0));
                p.push_back(points.at(0).positions.at(1));

                this->scene()->addEllipse(metersToPixels(p.at(0), true) - (radiusPixels / 2),
                                          metersToPixels(p.at(1), false) + (radiusPixels / 2),
                                          metersToPixels(radius, true), metersToPixels(radius, false), pen);
            }else if (points.size() > 0){
                // for each point in the trajectory
                for (int j = 0; j < (points.size() - 2); j += 2){
                    // if first point
                    if (j == 0){
                        // set pen color
                        if (populations_.at(p).robot_id == 0){
                            pen = pen1;
                        }else{
                            pen = pen2;
                        }
                        // draw a circle
                        this->scene()->addEllipse(metersToPixels(points.at(j).positions.at(0), true) - (radiusPixels / 2),
                                                  metersToPixels(points.at(j).positions.at(1), false) + (radiusPixels / 2),
                                                  metersToPixels(radius, true), metersToPixels(radius, false), pen);
                        pen = penTraj;
                    } 
                    // draw line to the next point
                    this->scene()->addLine(metersToPixels(points.at(j).positions.at(0), true),
                                           metersToPixels(points.at(j).positions.at(1), false),
                                           metersToPixels(points.at(j + 2).positions.at(0), true),
                                           metersToPixels(points.at(j + 2).positions.at(1), false),
                                           pen);
                }
            }

            ramp_msgs::RampTrajectory trj = populations_[p].population[t];

            if (trj.trajectory.points.size() > 0){

                trajectory_msgs::JointTrajectoryPoint p = trj.trajectory.points.at(trj.trajectory.points.size() - 1);

                int i_end = 0;

                // find knot point index where non-holonomic segment ends
                for (int i = 0; i < trj.holonomic_path.points.size(); i++)
                {
                    double dist = u.positionDistance(trj.holonomic_path.points[i].motionState.positions, p.positions);

                    if (dist * dist < 0.3){
                        i_end = i;
                        break;
                    }
                }

                penTraj = QPen(QColor(255, 0, 0, 255));

                for (int i = i_end; i < (int)trj.holonomic_path.points.size() - 1; i++){
                    // draw a line to the next point
                    this->scene()->addLine(metersToPixels(trj.holonomic_path.points[i].motionState.positions.at(0), true),
                                           metersToPixels(trj.holonomic_path.points[i].motionState.positions.at(1), false),
                                           metersToPixels(trj.holonomic_path.points[i + 1].motionState.positions.at(0), true),
                                           metersToPixels(trj.holonomic_path.points[i + 1].motionState.positions.at(1), false),
                                           penTraj);

                }
            }
        }
    }
}

//calculate pixel value of a distance. if width is true, treat the value has a x position, if false treat it as a y position.
int const TrajectoryView::metersToPixels(float value, bool isWidth){
    if (isWidth){
        return value * width_ / (maxWidthMeters_);
    }
    if (!isWidth){
        value *= -1;
        return value * height_ / (maxHeightMeters_);
    }
}