#!/bin/bash
set -e

echo "Running setup.."
./setup.sh
source /opt/ros/$ROS_DISTRO/setup.bash
echo "Running build.."
./build.sh
echo "Running test.."
./test.sh
