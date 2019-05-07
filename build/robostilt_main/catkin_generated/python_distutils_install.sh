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
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/fernandomierhicks/robostilt/src/robostilt_main"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/fernandomierhicks/robostilt/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/fernandomierhicks/robostilt/install/lib/python2.7/dist-packages:/home/fernandomierhicks/robostilt/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/fernandomierhicks/robostilt/build" \
    "/usr/bin/python" \
    "/home/fernandomierhicks/robostilt/src/robostilt_main/setup.py" \
    build --build-base "/home/fernandomierhicks/robostilt/build/robostilt_main" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/fernandomierhicks/robostilt/install" --install-scripts="/home/fernandomierhicks/robostilt/install/bin"
