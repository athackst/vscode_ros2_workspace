#!/bin/bash

# Purpose: script for installing ompl on a Ubuntu 18.04 system. If an error is encountered, try running each line individually, rather than running the whole script.

# Check for sudo flag
SUDO=""
for i in "$@"
do
case $i in
    -s|--sudo)
    SUDO="sudo "
    echo "Going to prepend the following to certain commands: ${SUDO}"
    shift # past argument=value
    ;;
esac
done

${SUDO}apt-get update
${SUDO}apt-get install -y \
       build-essential  \
       cmake \
       libboost-filesystem-dev \
       libboost-numpy-dev \
       libboost-program-options-dev \
       libboost-python-dev \
       libboost-serialization-dev \
       libboost-system-dev \
       libboost-test-dev \
       libeigen3-dev \
       libexpat1 \
       libflann-dev \
       libode-dev \
       libtinfo5 \
       libtriangle-dev \
       pkg-config \
       python2.7-dev \
       python2.7-numpy \
       python-netcdf4 \
       python-pip \
       python-tk \
       wget \

# Install spot
wget -q -O - https://www.lrde.epita.fr/repo/debian.gpg | apt-key add - && \
echo 'deb http://www.lrde.epita.fr/repo/debian/ stable/' >> /etc/apt/sources.list && \
${SUDO}apt-get update && \
${SUDO}apt-get install -y libspot-dev && \
# Install newer version of castxml than is available via apt-get:
wget -q -O- https://data.kitware.com/api/v1/file/5b68c2c28d777f06857c1f48/download | tar zxf - && \
# Install pypy2:
wget -q -O- https://bitbucket.org/pypy/pypy/downloads/pypy2-v6.0.0-linux64.tar.bz2 |tar jxf - && \
${SUDO}pip2 install pygccxml pyplusplus

# Install additional dependencies
DEBIAN_FRONTEND=noninteractive ${SUDO}apt-get install -y python-matplotlib
${SUDO}apt-get update && \
    apt-get install -y \
        nano \
        scrot \
        vim

${SUDO}pip2 install geopy pyautogui shapely wandb

# Run remaining installation script (note there are some redundant commands, but it wastes minimal amount of time) and generate Python bindings
${SUDO}./install-ompl-ubuntu-python2.sh --python
