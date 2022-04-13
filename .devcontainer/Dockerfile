FROM ghcr.io/patrick-5546/sailbot_ros2_workspace/dev

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

# Raye ROS1 sorkspace setup
WORKDIR /workspaces/catkin_ws
RUN git clone https://github.com/UBCSailbot/local-pathfinding.git src/local-pathfinding
RUN git clone https://github.com/UBCSailbot/sailbot-msg.git src/sailbot-msg
RUN /bin/bash -c "source /opt/ros/${ROS1_DISTRO}/setup.bash; catkin_make"

# Device-specific bash setup
COPY config/update_bashrc.sh /sbin/update_bashrc
RUN sudo chmod +x /sbin/update_bashrc ; sudo chown ros /sbin/update_bashrc ; sync ; /bin/bash -c /sbin/update_bashrc ; sudo rm /sbin/update_bashrc

# Copy device-specific configuration files (e.g. .vimrc) in config/user/ to the home directory
COPY config/user ${HOME}
