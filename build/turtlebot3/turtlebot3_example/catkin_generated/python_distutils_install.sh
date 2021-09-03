#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/emendel/Documents/IndepententStudy/ramp/src/turtlebot3/turtlebot3_example"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/emendel/Documents/IndepententStudy/ramp/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/emendel/Documents/IndepententStudy/ramp/install/lib/python3/dist-packages:/home/emendel/Documents/IndepententStudy/ramp/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/emendel/Documents/IndepententStudy/ramp/build" \
    "/usr/bin/python3.8" \
    "/home/emendel/Documents/IndepententStudy/ramp/src/turtlebot3/turtlebot3_example/setup.py" \
     \
    build --build-base "/home/emendel/Documents/IndepententStudy/ramp/build/turtlebot3/turtlebot3_example" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/emendel/Documents/IndepententStudy/ramp/install" --install-scripts="/home/emendel/Documents/IndepententStudy/ramp/install/bin"
