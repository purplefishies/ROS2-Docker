#!/bin/bash

docker build --build-arg USER=${USER} --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t myros2  .
