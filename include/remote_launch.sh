#!/usr/bin/env bash
# @neobotix
# https://wiki.ros.org/roslaunch/XML/machine
# semi-hack env-loader file
source $HOME/0rosrc
rosenv "leonart"
exec "$@"
