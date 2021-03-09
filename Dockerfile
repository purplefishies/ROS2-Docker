FROM osrf/ros:foxy-desktop
MAINTAINER jdamon@gmail.com
LABEL Description="ROS2server" VERSION="1.0"
ARG USER=docker
ARG UID=1000
ARG GID=1000
# default password for user
#ARG PW=docker

WORKDIR /home/${USER}
RUN apt-get update && apt-get install -y \
    sudo \
    tree \
    less
RUN useradd -U ${USER} --uid=${UID}  -G sudo
RUN chown -R ${USER}:${USER} /home/${USER}
USER ${UID}:${GID}

