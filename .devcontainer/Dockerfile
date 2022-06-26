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

# Copy device-specific configuration files (e.g. .vimrc) in config/user/ to the home directory
COPY config/user ${HOME}
