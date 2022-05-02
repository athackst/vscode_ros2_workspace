FROM ghcr.io/patrick-5546/sailbot_ros2_workspace/dev as builder

# ROS1 workspace setup
WORKDIR /workspaces/catkin_ws
RUN mkdir src
RUN /bin/bash -c "source /opt/ros/${ROS1_DISTRO}/setup.bash; catkin_make"
RUN git clone https://github.com/UBCSailbot/local-pathfinding.git src/local-pathfinding
RUN git clone https://github.com/UBCSailbot/sailbot-msg.git src/sailbot-msg
RUN /bin/bash -c "source /opt/ros/${ROS1_DISTRO}/setup.bash; catkin_make"
RUN /bin/bash -c "pip install protobuf==3.17.3"

# ROS2 workspace setup
WORKDIR /workspaces/sailbot_ros2_workspace
RUN mkdir src
RUN /bin/bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash; colcon build --merge-install --symlink-install"

# Source ros in bash setup
COPY update_bashrc_ros.sh /sbin/update_bashrc_ros
RUN sudo chmod +x /sbin/update_bashrc_ros ; sudo chown ros /sbin/update_bashrc_ros ; sync ; /bin/bash -c /sbin/update_bashrc_ros ; sudo rm /sbin/update_bashrc_ros

FROM builder

# # ** [Optional] Uncomment this section to install additional packages. **
# ENV DEBIAN_FRONTEND=noninteractive
# RUN apt-get update \
#   && apt-get -y install --no-install-recommends \
#   
#   # Clean up
#   && apt-get autoremove -y \
#   && apt-get clean -y \
#   && rm -rf /var/lib/apt/lists/*
# ENV DEBIAN_FRONTEND=dialog

# Device-specific bash setup
COPY config/update_bashrc_wsl.sh /sbin/update_bashrc_wsl
RUN sudo chmod +x /sbin/update_bashrc_wsl ; sudo chown ros /sbin/update_bashrc_wsl ; sync ; /bin/bash -c /sbin/update_bashrc_wsl ; sudo rm /sbin/update_bashrc_wsl

# Copy device-specific configuration files (e.g. .vimrc) in config/user/ to the home directory
COPY config/user ${HOME}
