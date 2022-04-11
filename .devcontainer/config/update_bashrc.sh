# Adding all the necessary ros sourcing
echo "" >> ~/.bashrc
echo "## ROS" >> ~/.bashrc
echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
echo "source /home/ros/ros_ws/install/setup.bash" >> ~/.bashrc
echo "export ROS_DOMAIN_ID=21" >> ~/.bashrc
