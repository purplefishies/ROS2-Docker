#!/bin/bash


XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth

touch $XAUTH

xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -


ROS_WS_DIR=/mnt/workspace/ros2_ws && HOMEDIR=/home/jimi_damon && \
docker run -e ROS_WS_DIR=$ROS_WS_DIR -it \
  --workdir /mnt/workspace \
  -v $HOME/Ros:/mnt/workspace  \
  -v $HOME/.inputrc:${HOMEDIR}/.inputrc:ro \
  -v $HOME/.bashrc:${HOMEDIR}/.bashrc:ro \
  -v $HOME/.bash_profile:${HOMEDIR}/.bash_profile:ro \
  -v $HOME/.ls_colors:${HOMEDIR}/.ls_colors \
  -v $HOME/.bash_alias:${HOMEDIR}/.bash_alias \
  -v $HOME/.tmux.conf:${HOMEDIR}/.tmux.conf \
  -v /tmp/.X11-unix/:/tmp/.X11-unix \
  -v /etc/sudoers.d:/etc/sudoers.d:ro \
  -v /etc/passwd:/etc/passwd:ro \
  -v /etc/shadow:/etc/shadow:ro \
  --privileged \
  -e DISPLAY=$DISPLAY \
  -e XAUTHORITY=$XAUTH \
  -e UID="$(id --user)" \
  -e GID="$(id -g )" \
  myros2:latest
