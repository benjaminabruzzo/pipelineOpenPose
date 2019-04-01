	https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
	# Native Linux Distribution Support in CUDA 10.0
	# Distribution 			Kernel* 	GCC 	GLIBC 	ICC 	PGI 	XLC 	CLANG
	# Ubuntu 16.04.5 (**) 	4.4 		5.4.0 	2.23 	18.0 	18.x 	NO 		6.0.0

	cd ~/pipelineOP/openpose_cfg/ && bash 001_install_deps.sh && cd ~/pipelineOP

	# download the cuda toolkit, CUDA Version: 10.1
	https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=debnetwork
	cd ~/pipelineOP/openpose_cfg/ && bash 002_install_cuda.sh && cd ~/pipelineOP

	# Test nvidia installation
	nvidia-smi

	# install cudnn 7.5.0.56-1
	# Download from 
	https://developer.nvidia.com/rdp/cudnn-download
	# libcudnn7-dev_7.5.0.56-1+cuda10.1_amd64.deb
	# libcudnn7-doc_7.5.0.56-1+cuda10.1_amd64.deb
	# libcudnn7_7.5.0.56-1+cuda10.1_amd64.deb
	cd ~/pipelineOP/openpose_cfg/ && bash 003_install_cudnn.sh && cd ~/pipelineOP

	# Build opencv from source 
	cd ~/pipelineOP/openpose_cfg/ && bash 004_install_opencv345_python35.sh && cd ~/pipelineOP
	# restart terminal

	# Build openpose from github
	# manually follow steps in 005_install_openpose.sh