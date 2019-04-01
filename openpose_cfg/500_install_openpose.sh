## Download and build openpose
# https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/installation.md

	mkdir -p ~/CMU/ && cd ~/CMU && git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose 
	cd ~/CMU/openpose && git pull origin master 
	# cd ~/CMU/openpose && . ./scripts/ubuntu/install_deps.sh
	cd ~/CMU/openpose && . ./models/getModels.sh

	# {#try } || {#catch } # Saves time by keeping models saved from earlier installation attempt
	# scp -rp benjamin@helios0.local:~/CMU/openpose/models/ ~/CMU/openpose/models/
	# { cp -a ~/pipeline16044/models/. ~/CMU/openpose/models ; } || { . ./models/getModels.sh	#; }

	mkdir -p cd ~/CMU/openpose/build && cd ~/CMU/openpose/build && cmake -DBUILD_PYTHON=ON .. 2>&1 | tee cmake_log.out  # This takes a while, just be patient

	cmake-gui
		# "Where is the source code?" /home/benjamin/CMU/openpose
		# "Where to build the binaries?" /home/benjamin/CMU/openpose/build
		# check BUILD_PYTHON

	make 2>&1 | tee make_log.out
	
	cd ~/CMU/openpose/build && sudo make install | tee install_log.out

# testing install
python3

import sys
import cv2
import os
from sys import platform
import argparse

sys.path.append('/usr/local/python')
from openpose import pyopenpose as op









