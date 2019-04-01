#!/bin/bash
cd ~/ros/src && catkin_init_workspace
cd ~/ros/ && catkin_make --cmake-args -DPYTHON_VERSION=3.6
source ~/ros/devel/setup.bash


