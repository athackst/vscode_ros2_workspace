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

# Device-specific bash setup
COPY config/update_bashrc_wsl.sh /sbin/update_bashrc_wsl
RUN sudo chmod +x /sbin/update_bashrc_wsl ; sudo chown ros /sbin/update_bashrc_wsl ; sync ; /bin/bash -c /sbin/update_bashrc_wsl ; sudo rm /sbin/update_bashrc_wsl

# Copy device-specific configuration files (e.g. .vimrc) in config/user/ to the home directory
COPY config/user ${HOME}
