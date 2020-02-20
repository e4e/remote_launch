#!/usr/bin/env bash
# @neobotix
# https://wiki.ros.org/roslaunch/XML/machine
# semi-hack env-loader file
source $HOME/0rosrc
rosenv "$1" # https://wiki.bash-hackers.org/scripting/posparams#range_of_positional_parameters
exec "${@:2}"
