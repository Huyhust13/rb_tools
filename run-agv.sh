#!/usr/bin/env bash

source /opt/ros/melodic/setup.bash
source $HOME/catkin_ws/devel/setup.bash
source $HOME/.bashrc
export ROS_MASTER_URI=http://192.168.11.21:11311
export ROS_HOSTNAME=192.168.11.21

T=30
if [ $# -ne 0 ]
then
T=$1
fi

echo "Launching application after $T (s), please wait..."
#sleep Ts

#for i in {0..$T..1}
for((i=1;i<=$T;i++))
do
  echo -n '.'
  sleep 1
done

echo

time=`date +%F_%H%M%S`
#file='/home/mkac/agv-log.txt'
file="/home/mkac/log_agv/$time.log"
echo $time | tee $file

roslaunch agvlidar_navigation agvlidar_navigation.launch 2>&1 | tee -a $file
cp $file lastest.log
# Note: using `2>&1 | tee -a` de log toan bo output tu INFO, WARN, ERR to file
