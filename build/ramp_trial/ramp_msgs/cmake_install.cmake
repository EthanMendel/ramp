# Install script for directory: /Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Users/ethanmendel/miniforge-pypy3/envs/robostackenv/bin/llvm-objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_msgs/msg" TYPE FILE FILES
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/BezierCurve.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/CircleGroup.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/Circle.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/EvaluationRequest.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/EvaluationResponse.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/KnotPoint.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/HilbertMap.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/MotionState.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/Path.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/RampTrajectory.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/Range.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/Obstacle.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/ObstacleList.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/Population.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/TrajectoryRequest.msg"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/msg/TrajectoryResponse.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_msgs/srv" TYPE FILE FILES
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/srv/EvaluationSrv.srv"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/srv/ModificationRequest.srv"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/srv/TrajectorySrv.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_msgs/cmake" TYPE FILE FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/build/ramp_trial/ramp_msgs/catkin_generated/installspace/ramp_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/devel/include/ramp_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/devel/share/roseus/ros/ramp_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/devel/share/common-lisp/ros/ramp_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/devel/share/gennodejs/ros/ramp_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/Users/ethanmendel/miniforge-pypy3/envs/robostackenv/bin/python3.8" -m compileall "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/devel/lib/python3.8/site-packages/ramp_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages" TYPE DIRECTORY FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/devel/lib/python3.8/site-packages/ramp_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/build/ramp_trial/ramp_msgs/catkin_generated/installspace/ramp_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_msgs/cmake" TYPE FILE FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/build/ramp_trial/ramp_msgs/catkin_generated/installspace/ramp_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_msgs/cmake" TYPE FILE FILES
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/build/ramp_trial/ramp_msgs/catkin_generated/installspace/ramp_msgsConfig.cmake"
    "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/build/ramp_trial/ramp_msgs/catkin_generated/installspace/ramp_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_msgs" TYPE FILE FILES "/Users/ethanmendel/Documents/School/Masters/RAMP/ramp/src/ramp_trial/ramp_msgs/package.xml")
endif()

