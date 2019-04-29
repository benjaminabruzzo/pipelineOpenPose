# Install dependencies, as I wasn't able to install them via rosdep
sudo apt-get install libusb-1.0-0 libusb-1.0-0-dev

# Clone libuvc_ros and libuvc to your workspace
cd ~/ros/src/ && git clone https://github.com/ktossell/libuvc_ros.git && git clone https://github.com/ktossell/libuvc.git

# The following instructions come from the libuvc's Readme file
mkdir libuvc/build && cd libuvc/build && cmake ..
make && sudo make install

# Run catkin
cd ~/ros/src/ && catkin build libuvc_ros

# Add camera to udev rules
# us lsusb to find the vendor id
sudo touch /etc/udev/rules.d/99-uvc.rules
echo "# UVC cameras" | sudo tee /etc/udev/rules.d/99-uvc.rules
echo "# Bus 001 Device 003: ID 046d:082d Logitech, Inc. HD Pro Webcam C920" | sudo tee -a /etc/udev/rules.d/99-uvc.rules
echo 'SUBSYSTEMS=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="082d", MODE="0666"' | sudo tee -a /etc/udev/rules.d/99-uvc.rules

