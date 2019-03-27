	https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
	# Native Linux Distribution Support in CUDA 10.0
	# Distribution 			Kernel* 	GCC 	GLIBC 	ICC 	PGI 	XLC 	CLANG
	# Ubuntu 16.04.5 (**) 	4.4 		5.4.0 	2.23 	18.0 	18.x 	NO 		6.0.0

	sudo apt-get install -y linux-headers-$(uname -r) python-dev python-devel numpy cmake
	sudo apt-get install -y libgoogle-glog-dev protobuf-compiler install libatlas-base-dev libeigen3-dev 
	sudo apt install cmake-qt-gui

	# download the cuda toolkit
	https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=debnetwork
	cd ~/pipeline16044/openpose_cfg/ && bash 002_install_cuda.sh && cd ~/pipeline16044

	# Test nvidia installation
	nvidia-smi

	# install cudnn 10.0.0
	# Download from 
	https://developer.nvidia.com/rdp/cudnn-download
	# gutterpuddles pointANDgloryZERO
	cd ~/pipeline16044/openpose_cfg/ && bash 003_install_cudnn.sh && cd ~/pipeline16044

	# Build opencv from source 
	cd ~/pipeline16044/openpose_cfg/ && bash 004_install_opencv3_4_5.sh && cd ~/pipeline16044
	# restart terminal


	# Build openpose from github
	https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/installation.md#installation


	scp benjamin@helios0.local:~/.ssh/id_rsa.pub ~/.ssh/helios0.pub && scp ~/.ssh/id_rsa.pub benjamin@helios0.local:~/.ssh/titan.pub
	scp benjamin@helios0.local:~/CMU/openpose/models/* ~/CMU/openpose/models/