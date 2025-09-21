#!/bin/bash
set -e

envsubst < src/ros2.repos | vcs import src
sudo apt-get update
rosdep update --rosdistro=$ROS_DISTRO
rosdep install --from-paths src --ignore-src -y --rosdistro=$ROS_DISTRO
