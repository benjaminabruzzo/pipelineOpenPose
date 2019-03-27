	cd ~/Downloads && sudo dpkg -i cuda-repo*.deb
	# cd ~/Downloads && sudo dpkg -i cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
	sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
	sudo apt-get update && sudo apt-get install -y cuda
		echo 'export PATH=/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/NsightCompute-2019.1${PATH:+:${PATH}}' >> ~/.bashrc && sudo reboot
	# echo '/usr/bin/nvidia-persistenced --verbose' >> ~/.bashrc
