# build command: docker build --tag ghcr.io/patrick-5546/sailbot_ros2_workspace/base:ros_eloquent-ompl_1_5_0_python3 .
FROM ros:eloquent-ros-base-bionic
LABEL org.opencontainers.image.source=https://github.com/patrick-5546/sailbot_ros2_workspace

###################### OMPL Setup ######################
COPY . /ompl
WORKDIR /ompl
RUN ./install-ompl-ubuntu-python3.sh --python

# Clean image
RUN sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*
WORKDIR /
