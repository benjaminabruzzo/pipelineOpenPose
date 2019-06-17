	# http://torch.ch/docs/getting-started.html#_
	# torch's distro for CUDA10
	sudo apt-get purge cmake
	cd ~/; git clone https://github.com/Kitware/CMake.git; cd CMake
	./bootstrap; make; sudo make install

	cd ~/; git clone https://github.com/nagadomi/distro.git ~/torch --recursive
	cd ~/torch; bash install-deps;
	cd ~/torch; ./install.sh;
	# cd ~/torch; ./clean.sh;
	# cd ~/torch; ./update.sh

	source ~/.bashrc && ./test.sh