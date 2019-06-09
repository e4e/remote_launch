# remote_launch
remote roslaunch launching a local PC launch file

## Basic Usage
1. setup nodes and all roslaunch file config on *PC Foo*  
(roslaunch files like `include/bringup.launch`)
1. consider an extra shell script for a centralized and consistent ROS environment sourcing setup  
(e.g. source `include/0rosrc` in `bash.rc` and everywhere else)
1. put the **remote_launch** package on *PC Foo* (catkin workspace, build it, ect. You know the drill) and adjust the `scripts/bringup` to launch your roslaunch file  
you can also create many more other scripts there 😉
1. then in the remote roslaunch file on *PC Bar* (e.g. `include/neobotix_bringup_remote.launch`) make sure to use an  
`env-loader="/home/neobotix/remote_launch.sh"` (this file resides on *PC Foo*) which is setting the respective environment variables on *PC Foo*  
(ROS_IP / ROS_HOSTNAME, especially the correct remote ROS_MASTER_URI of *PC Bar*)
- optional: use some auto start fallback logic on *PC Foo*  
(example `include/ROS_AUTOSTART+remote.sh`)
- you need [rosenv](https://github.com/LJMP/rosenv) to replicate the explained setup or you semi/hardcode all networking/IP settings in your scripts 😂😆

ToDo:  
+ [ ] you might need to fix up passwords and usenames in the files
+ [ ] read up on how to setup ssh with keys instead of password strings in plaintext 😋

## References
https://wiki.ros.org/roslaunch/XML/machine  
https://wiki.ros.org/roslaunch/XML/node

http://answers.ros.org/question/250591/remote-roslaunch-searching-local-pc-for-launch-file/?answer=251519#post-id-251519

does not work  
http://answers.ros.org/question/41413/how-to-include-a-launch-file-on-a-remote-machine-from-a-launch-file/?answer=41415#post-id-41415

---

tw 2019-06-09T03:31
