
mkdir -p ~/ros/src && cd ~/ros && rosinstall_generator desktop_full --rosdistro kinetic --deps --wet-only --tar > kinetic-desktop-full-wet.rosinstall
wstool init -j4 src kinetic-desktop-full-wet.rosinstall


rosdep install --from-paths src --ignore-src --rosdistro kinetic -y





wstool init -j4 src kinetic-desktop-full-wet.rosinstall
# catkin build --cmake-args -DPYTHON_VERSION=3.6
# sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential





./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release


echo ' ' >> ~/.bashrc
echo '. ~/.ros/.bashros' >> ~/.bashrc
cp ~/pipeline16044/settings/.bashros ~/.ros/
echo '. ~/.ros/.bashgazebo' >> ~/.bashrc
cp ~/pipeline16044/settings/.bashgazebo ~/.ros/

mkdir -p ~/ros/src
mkdir -p ~/ros/data/csv

