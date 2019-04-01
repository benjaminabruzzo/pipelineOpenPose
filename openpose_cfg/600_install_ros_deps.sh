# sudo add-apt-repository universe 
# sudo add-apt-repository multiverse 
# sudo add-apt-repository restricted
# sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo apt-get update 

# cd ~/pipelineOP/rospkg && git init && git remote add gh git@github.com:ros-infrastructure/rospkg.git && git pull gh master && sudo python3 setup.py install
# cd ~/pipelineOP/catkin_pkg && git init && git remote add gh git@github.com:ros-infrastructure/catkin_pkg.git && git pull gh master sudo python3 setup.py install
# cd ~/pipelineOP/catkin && git init && git remote add gh git@github.com:ros/catkin.git && git pull gh kinetic-devel sudo python3 setup.py install

sudo apt-get install -y python3-catkin-pkg 
sudo apt-get install -y python3-catkin-tools 
sudo apt-get install -y python3-rospkg
sudo apt-get install -y python3-yaml 
sudo apt-get install -y python3-rosdep
sudo apt-get install -y python3-rosinstall-generator 
sudo apt-get install -y python3-wstool 
sudo apt-get install -y python3-rosinstall 
sudo apt-get install -y python3-defusedxml
sudo apt-get install -y libtinyxml-dev
sudo apt-get install -y liblz4-dev

sudo apt-get install -y libbz2-dev

pip3 install --user defusedxml
sudo apt install -y python3-empy
sudo apt install -y libgpgme11-dev
pip3 install --user rospkg catkin_pkg
sudo pip3 install trollius

. 605_install_gtest.sh

# # Get python3 helper libraries
# sudo pip3 install rosdep 
# sudo pip3 install rosinstall_generator
# #sudo pip3 install wstool 
# sudo pip3 install rosinstall


sudo rosdep init
rosdep update



mkdir -p ~/cb_ws && cd ~/cb_ws
git clone https://github.com/ros/console_bridge && mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=../install ../console_bridge
make install

# Set python version before catkin build
export ROS_PYTHON_VERSION=3 
echo 'export ROS_PYTHON_VERSION=3' >> ~/.bashrc
export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:/home/benjamin/cb_ws/install
echo 'export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:/home/benjamin/cb_ws/install' >> ~/.bashrc