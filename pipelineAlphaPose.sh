	https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
	# Native Linux Distribution Support in CUDA 10.0
	# Distribution 			Kernel* 	GCC 	GLIBC 	ICC 	PGI 	XLC 	CLANG
	# Ubuntu 16.04.5 (**) 	4.4 		5.4.0 	2.23 	18.0 	18.x 	NO 		6.0.0

	cd ~/pipelineOP/openpose_cfg/ && sudo bash 100_install_deps.sh && cd ~/pipelineOP

	# download the cuda toolkit, CUDA Version: 10.0
	# gutter.puddles point and glory zero
	# https://developer.nvidia.com/cuda-10.0-download-archive?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=deblocal
	cd ~/Downloads && sudo dpkg -i cuda-repo*.deb
	sudo apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub
	sudo apt-get update && sudo apt-get install -y cuda-10-0
		echo 'export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}' >> ~/.bashrc 
	sudo reboot


	# Cuda 10.1 does not work
	# download the cuda toolkit, CUDA Version: 10.1
	# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=debnetwork
	# cd ~/pipelineOP/openpose_cfg/ && bash 200_install_cuda.sh && cd ~/pipelineOP
	# sudo reboot

	# Test nvidia installation
	nvidia-smi

	# install cudnn 7.5.0.56-1
	# Download from 
	https://developer.nvidia.com/rdp/cudnn-download
	# libcudnn7-dev_7.5.0.56-1+cuda10.1_amd64.deb
	# libcudnn7-doc_7.5.0.56-1+cuda10.1_amd64.deb
	# libcudnn7_7.5.0.56-1+cuda10.1_amd64.deb
	cd ~/pipelineOP/openpose_cfg/ && bash 250_install_cudnn.sh && cd ~/pipelineOP


	# https://github.com/MVIG-SJTU/AlphaPose

	# sudo apt-get update && sudo apt-get -y install python3-pip
	# sudo apt install python3-dev python3-pip
	# or 
	sudo apt install python-dev python-pip  

	cd ~/ && git clone https://github.com/MVIG-SJTU/AlphaPose.git 
	cd ~/AlphaPose/human-detection/lib/ && make clean && make && cd newnms/ && make && cd ../../../

	# Install Torch 
	# http://torch.ch/docs/getting-started.html#_
	git clone https://github.com/torch/distro.git ~/torch --recursive
	cd ~/torch; bash install-deps;
	./install.sh

	source ~/.bashrc

	# Install TensorFlow(verson >= 1.2). 
	# https://www.tensorflow.org/install/pip
	# pip3 install --user --upgrade tensorflow # install in $HOME (no GPU support)
	# pip3 uninstall tensorflow # install in $HOME (no GPU support)
	# pip3 install --user --upgrade tensorflow-gpu # install in $HOME (no GPU support)
	# pip3 uninstall tensorflow-gpu # install in $HOME

	pip install --user --upgrade tensorflow # install in $HOME (no GPU support)
	# pip3 uninstall tensorflow # install in $HOME (no GPU support)
	pip install --user --upgrade tensorflow-gpu # install in $HOME
	# pip3 uninstall tensorflow-gpu # install in $HOME


	# Install related dependencies by:
	cd  ~/AlphaPose; chmod +x install.sh; ./install.sh
	cd  ~/AlphaPose; chmod +x fetch_models.sh; ./fetch_models.sh



	cd  ~/AlphaPose; ./run.sh --indir examples/demo/ --outdir examples/results/ --vis




# 	# Add NVIDIA package repositories
# # Add HTTPS support for apt-key
# sudo apt-get install gnupg-curl
# wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
# sudo dpkg -i cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
# sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
# sudo apt-get update
# wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb
# sudo apt install ./nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb
# sudo apt-get update

# # Install NVIDIA driver
# # Issue with driver install requires creating /usr/lib/nvidia
# sudo mkdir /usr/lib/nvidia
# sudo apt-get install --no-install-recommends nvidia-410
# # Reboot. Check that GPUs are visible using the command: nvidia-smi

# # Install development and runtime libraries (~4GB)
# sudo apt-get install --no-install-recommends \
#     cuda-10-0 \
#     libcudnn7=7.4.1.5-1+cuda10.0  \
#     libcudnn7-dev=7.4.1.5-1+cuda10.0


# # Install TensorRT. Requires that libcudnn7 is installed above.
# sudo apt-get update && \
#         sudo apt-get install nvinfer-runtime-trt-repo-ubuntu1604-5.0.2-ga-cuda10.0 \
#         && sudo apt-get update \
#         && sudo apt-get install -y --no-install-recommends libnvinfer-dev=5.0.2-1+cuda10.0
