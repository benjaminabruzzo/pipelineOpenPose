# Install dependencies, as I wasn't able to install them via rosdep
sudo apt-get install libusb-1.0-0 libusb-1.0-0-dev

# Clone libuvc_ros and libuvc to your workspace
cd ~/ros/src/ && git clone https://github.com/ktossell/libuvc_ros.git && git clone https://github.com/ktossell/libuvc.git

# The following instructions come from the libuvc's Readme file
mkdir libuvc/build && cd libuvc/build && cmake ..
make && sudo make install

# Run catkin
cd ~/ros/src/ && catkin build libuvc_ros