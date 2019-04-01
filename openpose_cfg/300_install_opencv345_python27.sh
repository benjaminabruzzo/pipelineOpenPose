# https://www.pyimagesearch.com/2015/06/22/install-opencv-3-0-and-python-2-7-on-ubuntu/

	sudo apt-get install -y build-essential cmake pkg-config libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev
	sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev
	sudo apt-get install -y libgtk2.0-dev libgtk-3-dev libatlas-base-dev gfortran
	sudo apt-get install -y python2.7-dev python3.5-dev
	wget https://bootstrap.pypa.io/get-pip.py
	sudo python get-pip.py

	pip install numpy --user 
	pip install pyyaml --user 
	pip install imutils --user 

	mkdir -p ~/opencv/opencv && cd ~/opencv/opencv && git init 
	git remote add gh git@github.com:opencv/opencv.git && git pull gh master && git fetch gh && git checkout 3.4.5

	mkdir -p ~/opencv/opencv_contrib && cd ~/opencv/opencv_contrib && git init 
	git remote add gh git@github.com:opencv/opencv_contrib.git && git pull gh master && git fetch gh && git checkout 3.4.5

	mkdir -p ~/opencv/opencv/build && cd ~/opencv/opencv/build 

	cmake -D CMAKE_BUILD_TYPE=RELEASE \
		-D CMAKE_INSTALL_PREFIX=/usr/local \
		-D INSTALL_C_EXAMPLES=ON \
		-D INSTALL_PYTHON_EXAMPLES=ON \
		-D OPENCV_EXTRA_MODULES_PATH=~/opencv/opencv_contrib/modules \
		-D BUILD_NEW_PYTHON_SUPPORT=ON \
		-D BUILD_PYTHON_SUPPORT=ON \
		-D BUILD_EXAMPLES=ON .. 2>&1 | tee cmake_log.out

	make 2>&1 | tee make_log.out
	sudo make install 2>&1 | tee install_log.out 

	sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
	sudo ldconfig

	echo 'export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages' >> ~/.bashrc