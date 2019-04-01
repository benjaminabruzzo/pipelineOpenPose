#!/usr/bin/env bash

# Configure your catkin workspace
mkdir -p ~/ros && cd ~/ros && catkin config --init && catkin config -DCMAKE_BUILD_TYPE=Release

cd ~/ros && git clone https://github.com/tkruse/vcstools && cd ~/ros/vcstools && git checkout mock_server_tar_test && sudo python3 setup.py develop
cd ~/ros && git clone https://github.com/vcstools/wstool && cd ~/ros/wstool && sudo python3 setup.py develop && wstool --help

# Pull bare-bone dependencies for ROS (kinetic) and use workspace tool to initialize
cd ~/ros && rosinstall_generator ros_comm --rosdistro kinetic --deps --tar > kinetic-ros_comm.rosinstall
# rosinstall_generator --rosdistro kinetic desktop_full 
cd ~/ros && wstool init -j1 src kinetic-ros_comm.rosinstall 2>&1 | tee ~/ros/wstool_init.log

cd ~/ros && catkin build -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_VERSION=3.5 2>&1 | tee ~/ros/catkin_build.log
source ~/ros/devel/setup.bash



# cd ~/ros && ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_VERSION=3.5 2>&1 | tee ~/ros/catkin_make_isolated.log

# Note:
# You will probably see two build errors because of inappropriately set compile flags. They will try to compile without C++11 and fail.
# You can manually go to these CMakeLists.txt files and add "std=c++11" to the compile options and build again.
# Candidate trouble makers : src/ros_comm/rosbag & src/ros_comm/rosbag_storage

# Add other necessary ROS-Packages using rosinstall_generator
# cd ~/ros && rosinstall_generator ros_comm console_bridge sensor_msgs nav_msgs geometry_msgs --rosdistro kinetic --deps --tar > kinetic-ros_comm.rosinstall
# cd ~/ros && wstool merge -t src kinetic-ros_comm.rosinstall
# cd ~/ros && wstool update -t src/


# cd ~/ros && catkin build
# rosdep install --from-paths ~/ros/src --ignore-src ...


