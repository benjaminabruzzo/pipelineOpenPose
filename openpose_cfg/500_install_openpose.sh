## Download and build openpose
# https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/installation.md

	mkdir -p ~/CMU/ && cd ~/CMU && git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose 
	cd ~/CMU/openpose && git pull origin master 
	# cd ~/CMU/openpose && . ./scripts/ubuntu/install_deps.sh
	cd ~/CMU/openpose && . ./models/getModels.sh

	# {#try } || {#catch } # Saves time by keeping models saved from earlier installation attempt
	# scp -rp benjamin@helios0.local:~/CMU/openpose/models/ ~/CMU/openpose/
	# { cp -a ~/pipeline16044/models/. ~/CMU/openpose/models ; } || { . ./models/getModels.sh	#; }

	mkdir -p cd ~/CMU/openpose/build && cd ~/CMU/openpose/build && cmake -DBUILD_PYTHON=ON .. 2>&1 | tee cmake_log.out  # This takes a while, just be patient

	cd ~/CMU/openpose/build && cmake-gui
		# "Where is the source code?" /home/benjamin/CMU/openpose
		# "Where to build the binaries?" /home/benjamin/CMU/openpose/build
		# check BUILD_PYTHON
		## To build for python 2.7:
		# Check "advanced"
		# PYTHON_EXECUTABLE=/usr/bin/python2.7
		# PYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython2.7.so

	cd ~/CMU/openpose/build && make 2>&1 | tee make_log.out
	
	cd ~/CMU/openpose/build && sudo make install | tee install_log.out











