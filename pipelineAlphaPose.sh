	https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
	# Native Linux Distribution Support in CUDA 10.0
	# Distribution 			Kernel* 	GCC 	GLIBC 	ICC 	PGI 	XLC 	CLANG
	# Ubuntu 16.04.5 (**) 	4.4 		5.4.0 	2.23 	18.0 	18.x 	NO 		6.0.0

	cd ~/pipelineOP/openpose_cfg/ && sudo bash 100_install_deps.sh && cd ~/pipelineOP

	# download the cuda toolkit, CUDA Version: 10.0
	# gutter.puddles point and glory zero
	# https://developer.nvidia.com/cuda-10.0-download-archive?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=deblocal
	cd ~/pipelineOP/openpose_cfg/ && bash 201_install_cuda-10-0.sh && cd ~/pipelineOP

	# Test nvidia installation
	nvidia-smi

	# install cudnn 7.6.0
	# Download from 
	# https://developer.nvidia.com/rdp/cudnn-download
	# libcudnn7_*_amd64.deb libcudnn7-dev_*_amd64.deb libcudnn7-doc_*_amd64.deb
	cd ~/pipelineOP/openpose_cfg/ && bash 250_install_cudnn.sh && cd ~/pipelineOP

	# https://github.com/MVIG-SJTU/AlphaPose
	# cd ~/; git clone https://github.com/MVIG-SJTU/AlphaPose.git 
	cd ~/; git clone git@github.com:benjaminabruzzo/AlphaPose.git
	cd ~/AlphaPose/human-detection/lib/ && make clean && make && cd newnms/ && make && cd ../../../

	# Install Torch 
	cd ~/pipelineOP/openpose_cfg/ && bash 251_install_torch_for_cuda-10-0.sh && cd ~/pipelineOP

	# Install TensorFlow(verson >= 1.2). 
	cd ~/pipelineOP/openpose_cfg/ && bash 252_install_tensorflow_for_cuda-10-0.sh && cd ~/pipelineOP

	# Install related dependencies by:
	pip install pyyaml --user 
	cd  ~/AlphaPose; chmod +x install.sh; ./install.sh
	# cd  ~/AlphaPose; chmod +x fetch_models.sh; ./fetch_models.sh
	scp benjamin@saturn.local:~/Downloads/alphapose/output.zip ~/AlphaPose/human-detection/; cd ~/AlphaPose/human-detection/; unzip output.zip; rm output.zip
	mkdir ~/AlphaPose/predict/models; scp benjamin@saturn.local:~/Downloads/alphapose/final_model.t7 ~/AlphaPose/predict/models/

	# cd  ~/AlphaPose; ./run.sh --indir examples/demo/ --outdir examples/results/ --vis
	cd  ~/AlphaPose; ./run.sh --indir examples/aggressive/src/ --outdir examples/aggressive/results --vis

	git add --all .; git commit -m 'adding test files'

	


	# checkout real-time mxnet version
	git fetch origin; git checkout mxnet; mkdir ~/AlphaPose/sppe/params/
	scp benjamin@saturn.local:~/Downloads/alphapose/duc_se.params ~/AlphaPose/sppe/params/

	# install gluoncv
	pip install --upgrade setuptools; cd ~/AlphaPose; pip install mxnet-mkl>=1.4.0 --upgrade

	# pip install --upgrade gluoncv
	mkdir -p ~/gluoncv; git clone https://github.com/dmlc/gluon-cv ~/gluoncv
	cd ~/gluoncv && python setup.py install --user


	# download gsutil
	mkdir -p ~/gsutil; cd ~/gsutil; curl https://sdk.cloud.google.com | bash
	# open new terminal
	mkdir -p ~/datasets/coco/val2017/images && gsutil -m rsync gs://images.cocodataset.org/val2017 ~/datasets/coco/val2017/images
	# mkdir -p ~/datasets/coco/annotations && cd ~/datasets/coco/annotations && gsutil -m rsync gs://images.cocodataset.org/annotations $PWD
	# gsutil -m rsync gs://images.cocodataset.org/annotations ~/datasets/coco/annotations
	mkdir -p ~/AlphaPose/data/coco/annotations/; cd ~/AlphaPose/data/coco/;
	scp benjamin@saturn.local:~/Downloads/alphapose/annot_coco.h5 ~/AlphaPose/data/coco/
	scp benjamin@saturn.local:~/Downloads/alphapose/annotations_trainval2014.zip ~/AlphaPose/data/coco/; unzip annotations_trainval2014.zip; rm annotations_trainval2014.zip
	cp ~/AlphaPose/data/coco/annotations/person_keypoints_val2014.json ~/AlphaPose/data/coco/

		# wget http://images.cocodataset.org/annotations/annotations_trainval2014.zip; unzip annotations_trainval2014.zip; rm annotations_trainval2014.zip
		# wget http://images.cocodataset.org/annotations/annotations_trainval2017.zip; unzip annotations_trainval2017.zip; rm annotations_trainval2017.zip
		# wget http://images.cocodataset.org/annotations/image_info_test2014.zip; unzip image_info_test2014.zip; rm image_info_test2014.zip
		# wget http://images.cocodataset.org/annotations/image_info_unlabeled2017.zip; unzip image_info_unlabeled2017.zip; rm image_info_unlabeled2017.zip
		# wget http://images.cocodataset.org/annotations/stuff_image_info_test2017.zip; unzip stuff_image_info_test2017.zip; rm stuff_image_info_test2017.zip
		# wget http://images.cocodataset.org/annotations/image_info_test2015.zip; unzip image_info_test2015.zip; rm image_info_test2015.zip
		# wget http://images.cocodataset.org/annotations/image_info_test2017.zip; unzip image_info_test2017.zip; rm image_info_test2017.zip
		# wget http://images.cocodataset.org/annotations/stuff_annotations_trainval2017.zip; unzip stuff_annotations_trainval2017.zip; rm stuff_annotations_trainval2017.zip
		# wget http://images.cocodataset.org/annotations/panoptic_annotations_trainval2017.zip; unzip panoptic_annotations_trainval2017.zip; rm panoptic_annotations_trainval2017.zip


	# test alpha pose

	mkdir -p ~/AlphaPose/exp; mkdir -p ~/AlphaPose/src; 
	cd ~/AlphaPose; MXNET_CPU_WORKER_NTHREADS=2 python video_demo.py --nClasses 33


	echo 'export PYTHONPATH="${PYTHONPATH}:/home/benjamin/AlphaPose"' >> ~/.bashrc
	echo 'echo "Python Path: " $PYTHONPATH' >> ~/.bashrc



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
