#! /usr/bin/env bash

# We remove a folder that otherwise gives issues in ROS2 launches
sudo rm -r /home/user/.ros

# Check if the first argument is 'debug'
if [ "$1" = "debug" ]; then
    #export ROS2_WS_PATH=/home/user/ros2_ws
    export ROS2_WS_PATH=/home/user/ros2_ws
else
    export ROS2_WS_PATH=/home/simulations/ros2_sims_ws
fi

# We set up the environment for ROS2
. /usr/share/gazebo/setup.sh
. ${ROS2_WS_PATH}/install/setup.bash

export GAZEBO_RESOURCE_PATH=${ROS2_WS_PATH}/src/t3_humble_simulation_pkgs/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo:${ROS2_WS_PATH}/src/t3_humble_simulation_pkgs/turtlebot3/turtlebot3_description:${GAZEBO_RESOURCE_PATH}
export GAZEBO_MODEL_PATH=${ROS2_WS_PATH}/src/t3_humble_simulation_pkgs/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models:${GAZEBO_MODEL_PATH}
export TURTLEBOT3_MODEL=burger
ros2 launch turtlebot3_gazebo turtlebot3_world_spawnfix.launch.py

