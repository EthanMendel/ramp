# Install script for directory: /home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/emendel/Documents/IndepententStudy/ramp/install")
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

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_msgs/msg" TYPE FILE FILES
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/msg/BezierCurve.msg"
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/msg/EvaluationRequest.msg"
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/msg/EvaluationResponse.msg"
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/msg/KnotPoint.msg"
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/msg/MotionState.msg"
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/msg/Path.msg"
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/msg/RampTrajectory.msg"
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/msg/Range.msg"
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/msg/Obstacle.msg"
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/msg/ObstacleList.msg"
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/msg/Population.msg"
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/msg/TrajectoryRequest.msg"
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/msg/TrajectoryResponse.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_msgs/srv" TYPE FILE FILES
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/srv/EvaluationSrv.srv"
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/srv/ModificationRequest.srv"
    "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/srv/TrajectorySrv.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_msgs/cmake" TYPE FILE FILES "/home/emendel/Documents/IndepententStudy/ramp/build/ramp_trial/ramp_msgs/catkin_generated/installspace/ramp_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/emendel/Documents/IndepententStudy/ramp/devel/include/ramp_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/emendel/Documents/IndepententStudy/ramp/devel/share/roseus/ros/ramp_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/emendel/Documents/IndepententStudy/ramp/devel/share/common-lisp/ros/ramp_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/emendel/Documents/IndepententStudy/ramp/devel/share/gennodejs/ros/ramp_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3.8" -m compileall "/home/emendel/Documents/IndepententStudy/ramp/devel/lib/python3/dist-packages/ramp_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/emendel/Documents/IndepententStudy/ramp/devel/lib/python3/dist-packages/ramp_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/emendel/Documents/IndepententStudy/ramp/build/ramp_trial/ramp_msgs/catkin_generated/installspace/ramp_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_msgs/cmake" TYPE FILE FILES "/home/emendel/Documents/IndepententStudy/ramp/build/ramp_trial/ramp_msgs/catkin_generated/installspace/ramp_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_msgs/cmake" TYPE FILE FILES
    "/home/emendel/Documents/IndepententStudy/ramp/build/ramp_trial/ramp_msgs/catkin_generated/installspace/ramp_msgsConfig.cmake"
    "/home/emendel/Documents/IndepententStudy/ramp/build/ramp_trial/ramp_msgs/catkin_generated/installspace/ramp_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ramp_msgs" TYPE FILE FILES "/home/emendel/Documents/IndepententStudy/ramp/src/ramp_trial/ramp_msgs/package.xml")
endif()

