# Adding all the necessary ros sourcing
echo "" >> ~/.bashrc
echo "## ROS" >> ~/.bashrc
echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc
echo "export _colcon_cd_root=/workspaces/sailbot_ros2_workspace" >> ~/.bashrc
echo "# unsetting ROS_DISTRO to silence ROS_DISTRO override warning" >> ~/.bashrc
echo "unset ROS_DISTRO" >> ~/.bashrc
echo "# setup ros1 environment" >> ~/.bashrc
echo "source /workspaces/catkin_ws/devel/setup.bash" >> ~/.bashrc
echo "# unsetting ROS_DISTRO to silence ROS_DISTRO override warning" >> ~/.bashrc
echo "unset ROS_DISTRO" >> ~/.bashrc
echo "# setup ros2 environment" >> ~/.bashrc
echo "source /workspaces/sailbot_ros2_workspace/install/setup.bash" >> ~/.bashrc
