#!/usr/bin/env bash
# @neobotix
# wait X seconds for remote roscore master to boot up
# if master is up, do nothing and await a remotely triggered bringup via the remote_launch node
# else will start local bringup.launch

whoami
echo "auto-starting ros ..."
source $HOME/0rosrc

_master="leonart"
echo "setting $_master as master ..."
rosenv $_master

echo "check master is reachable?"
# https://www.reddit.com/r/bash/comments/3mjyq9/sleeping_in_loop_not_working/
for i in {1..4}; do
  echo "try #$i"
  rostopic list > /dev/null
  # rostopic list will take 2-5s for answer, depending on host reachable/ros up
  if [ $? -eq 0 ]; then
    echo 'master is up. awaiting remote bringup launch ...'
    _alive=1
    break
  fi
  # adjust extra extern roscore startup leeway
  sleep 3
done

if [ -z $_alive ]; then
  echo 'master is down. falling back to local master ...'
  _master="self"
  rosenv $_master

  export _master_uri="NeoMaster=$_master"
  # ^ used for rosservice call /relayboard_v2/set_LCD_msg in neo_mpo_700 bringup.launch

  # set terminal title
  echo -e "\033]2;$ROS_MASTER_URI\007"

  #start ros
  roslaunch neo_mpo_700 bringup.launch
fi

unset _master
unset _alive
