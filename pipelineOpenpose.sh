	https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
	# Native Linux Distribution Support in CUDA 10.0
	# Distribution 			Kernel* 	GCC 	GLIBC 	ICC 	PGI 	XLC 	CLANG
	# Ubuntu 16.04.5 (**) 	4.4 		5.4.0 	2.23 	18.0 	18.x 	NO 		6.0.0

	cd ~/pipelineOP/openpose_cfg/ && bash 100_install_deps.sh && cd ~/pipelineOP

	# download the cuda toolkit, CUDA Version: 10.1
	https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=debnetwork
	cd ~/pipelineOP/openpose_cfg/ && bash 200_install_cuda.sh && cd ~/pipelineOP
	sudo reboot

	# Test nvidia installation
	nvidia-smi

	# install cudnn 7.5.0.56-1
	# Download from 
	https://developer.nvidia.com/rdp/cudnn-download
	# libcudnn7-dev_7.5.0.56-1+cuda10.1_amd64.deb
	# libcudnn7-doc_7.5.0.56-1+cuda10.1_amd64.deb
	# libcudnn7_7.5.0.56-1+cuda10.1_amd64.deb
	cd ~/pipelineOP/openpose_cfg/ && bash 250_install_cudnn.sh && cd ~/pipelineOP

	# Build opencv from source 
	# cd ~/pipelineOP/openpose_cfg/ && bash 300_install_opencv345_python35.sh && cd ~/pipelineOP
	# restart terminal

	# Build openpose from github
	# manually follow steps in 500_install_openpose.sh
	## test python installs:
	cd ~/pipelineOP/openpose_cfg/ && python 504_test_python.py
	cd ~/pipelineOP/openpose_cfg/ && python 504_test_python.py

	# Install ROS
		## install dependencies
		cd ~/pipelineOP/openpose_cfg/ && bash 600_install_ros_deps.sh && cd ~/pipelineOP
		# Reboot

		## install ros
		cd ~/pipelineOP/openpose_cfg/ && bash 700_install_ros_kinetic.sh && cd ~/ros
		# Reboot
	
		## initialize ros
		cd ~/pipelineOP/openpose_cfg/ && bash 710_init_ros.sh && cd ~/pipelineOP


