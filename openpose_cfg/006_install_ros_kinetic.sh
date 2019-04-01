sudo add-apt-repository universe 
sudo add-apt-repository multiverse 
sudo add-apt-repository restricted
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo apt-get update 
sudo apt-get install -y ros-kinetic-desktop-full 

sudo rosdep init
rosdep update

sudo apt-get install -y python3-yaml

cd ~/pipelineOP/rospkg && git init && git remote add gh git@github.com:ros-infrastructure/rospkg.git && git pull gh master && sudo python3 setup.py install
cd ~/pipelineOP/catkin_pkg && git init && git remote add gh git@github.com:ros-infrastructure/catkin_pkg.git && git pull gh master sudo python3 setup.py install
cd ~/pipelineOP/catkin && git init && git remote add gh git@github.com:ros/catkin.git && git pull gh kinetic-devel sudo python3 setup.py install

echo ' ' >> ~/.bashrc
echo '. ~/.ros/.bashros' >> ~/.bashrc
cp ~/pipeline16044/settings/.bashros ~/.ros/
echo '. ~/.ros/.bashgazebo' >> ~/.bashrc
cp ~/pipeline16044/settings/.bashgazebo ~/.ros/

mkdir -p ~/ros/src
mkdir -p ~/ros/data/csv

