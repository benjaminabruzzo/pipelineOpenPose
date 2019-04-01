sudo apt-get remove python-wstools python-wstool python3-wstool && sudo apt autoremove
sudo apt-get remove python-vcstools python3-vcstools && sudo apt autoremove


sudo apt-get remove -y python-empy && sudo apt autoremove

sudo apt-get purge ros-*
sudo apt-get autoremove
cd ~/ && rm -rf ros
cd /etc && sudo rm -rf ros
cd /opt && sudo rm -rf ros