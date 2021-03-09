#!/bin/bash

ROS_WS_DIR=/mnt/workspace/ros2_ws && HOMEDIR=/home/jdamon && docker run -e ROS_WS_DIR=$ROS_WS_DIR --workdir /mnt/workspace  -v $HOME/Ros:/mnt/workspace -it -v $HOME/.inputrc:${HOMEDIR}/.inputrc:ro -v $HOME/.bashrc:${HOMEDIR}/.bashrc:ro -v $HOME/.ls_colors:${HOMEDIR}/.ls_colors -v $HOME/.bash_alias:${HOMEDIR}/.bash_alias -e UID="$(id --user)" -e GID="$(id -g )" myros2:latest
