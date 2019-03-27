		cd ~/Downloads

		# Install the runtime library, for example:
		sudo dpkg -i libcudnn7_*_amd64.deb

		# Install the developer library, for example:
		sudo dpkg -i libcudnn7-dev_7*_amd64.deb

		# Install the code samples and the cuDNN Library User Guide, for example:
		sudo dpkg -i libcudnn7-doc_7*_amd64.deb

	### Verifying installation
		# Copy the cuDNN sample to a writable path.
		cp -r /usr/src/cudnn_samples_v7/ $HOME

		# Go to the writable path.
		cd  $HOME/cudnn_samples_v7/mnistCUDNN

		# Compile the mnistCUDNN sample.
		make clean && make

		# Run the mnistCUDNN sample.
		./mnistCUDNN

		# remove test files
		rm -rf ~/cudnn_samples_v7