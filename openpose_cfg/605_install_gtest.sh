sudo apt-get install libgtest-dev
mkdir /tmp/gtest_build && cd /tmp/gtest_build
cmake /usr/src/gtest
make
#copy or symlink libgtest.a and ligtest_main.a to /usr/lib folder
sudo cp *.a /usr/lib
