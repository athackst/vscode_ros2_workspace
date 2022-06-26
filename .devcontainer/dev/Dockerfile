FROM ghcr.io/patrick-5546/sailbot_ros2_workspace/base:raye as builder

# https://github.com/athackst/dockerfiles/blob/main/ros2/eloquent.Dockerfile
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
  && apt-get -y install --no-install-recommends \
  bash-completion \
  cmake \
  curl \
  gdb \
  less \
  pylint3 \
  python-autopep8 \
  python3-argcomplete \
  python3-pip \
  vim \
  wget \
  # Clean up
  && apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create a non-root user
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
  # [Optional] Add sudo support for the non-root user
  && apt-get update \
  && apt-get install -y sudo \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
  && chmod 0440 /etc/sudoers.d/$USERNAME \
  # Cleanup
  && rm -rf /var/lib/apt/lists/* \
  && echo "source /usr/share/bash-completion/completions/git" >> /home/$USERNAME/.bashrc \
ENV DEBIAN_FRONTEND=

FROM builder
LABEL org.opencontainers.image.source=https://github.com/patrick-5546/sailbot_ros2_workspace

ENV USER ros
USER ros
ENV HOME /home/${USER}

# Persist ROS logs
RUN mkdir -p ${HOME}/.ros/log \
    && chown -R ${USER} ${HOME}/.ros/log

# Persist bash history
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=${HOME}/commandhistory/.bash_history" \
  && mkdir ${HOME}/commandhistory \
  && touch ${HOME}/commandhistory/.bash_history \
  && chown -R ${USER} ${HOME}/commandhistory \
  && echo $SNIPPET >> "/home/${USER}/.bashrc"

# Source ros in bash setup
COPY update_bashrc_ros.sh /sbin/update_bashrc_ros
RUN sudo chmod +x /sbin/update_bashrc_ros ; sudo chown ros /sbin/update_bashrc_ros ; sync ; /bin/bash -c /sbin/update_bashrc_ros ; sudo rm /sbin/update_bashrc_ros

# ROS1 workspace setup
WORKDIR /workspaces/catkin_ws
RUN mkdir src
RUN /bin/bash -c "source /opt/ros/${ROS1_DISTRO}/setup.bash; catkin_make"
RUN git clone https://github.com/UBCSailbot/local-pathfinding.git src/local-pathfinding
RUN git clone https://github.com/UBCSailbot/boat_controller.git src/boat_controller
RUN git clone https://github.com/UBCSailbot/sailbot-msg.git src/sailbot-msg
RUN /bin/bash -c "source /opt/ros/${ROS1_DISTRO}/setup.bash; catkin_make"
RUN /bin/bash -c "pip install protobuf==3.17.3"
