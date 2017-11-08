# File:		opencv_install_source_x86
# Author:	Mark Heywood
# Website:	www.bluetin.com
# License:	MIT
# Version:	0.10

# This script installs OpenCV from source.
# The script is for x86 systems and will work on Raspberry Pi Desktop in a VirtualBox virtual machine.
# Another script is available for the Raspberry Pi platform hardware.
# The set up process will be logged in the cvlog.txt.

# Set OpenCV version to install
VERSION=3.3.0

# Exit the script on command error.
set -o errexit
# Get number of CPU cores in system.
CPU_CORES=$(grep -c ^processor /proc/cpuinfo)
# Get date.
DATE=$(date)
START=$(date)

echo "==========================================================" >> ~/cvlog.txt
echo "      Welcome to OpenCV $VERSION install script." >> ~/cvlog.txt
echo "Download and install OpenCV $VERSION and Its dependencies." >> ~/cvlog.txt
echo "==========================================================" >> ~/cvlog.txt
echo "Started: $DATE" >> ~/cvlog.txt
echo "CPU cores: $CPU_CORES" >> ~/cvlog.txt
echo "---------------------------" >> ~/cvlog.txt
echo "---------------------------" >> ~/cvlog.txt
echo "Lets get the system packages upto date..." >> ~/cvlog.txt
echo "sudo apt-get update" >> ~/cvlog.txt
sudo apt-get update
echo "---" >> ~/cvlog.txt
echo "---" >> ~/cvlog.txt
DATE=$(date)
echo "--> $DATE" >> ~/cvlog.txt
echo "Now installing dependencies" >> ~/cvlog.txt
echo "---------------------------" >> ~/cvlog.txt
echo "Installing developer tools to support OpenCV build process..." >> ~/cvlog.txt
echo "build-essential" >> ~/cvlog.txt
sudo apt-get install -y build-essential
echo "cmake" >> ~/cvlog.txt
sudo apt-get install -y cmake
echo "pkg-config" >> ~/cvlog.txt
sudo apt-get install -y pkg-config
DATE=$(date)
echo "--> $DATE" >> ~/cvlog.txt
echo "---" >> ~/cvlog.txt
echo "Installing some packages for images..." >> ~/cvlog.txt
echo "libjpeg-dev" >> ~/cvlog.txt
sudo apt-get install -y libjpeg-dev
echo "libtiff5-dev" >> ~/cvlog.txt
sudo apt-get install -y libtiff5-dev
echo "libjasper-dev" >> ~/cvlog.txt
sudo apt-get install -y libjasper-dev
echo "libpng12-dev" >> ~/cvlog.txt
sudo apt-get install -y libpng12-dev
DATE=$(date)
echo "--> $DATE" >> ~/cvlog.txt
echo "---" >> ~/cvlog.txt
echo "installing packages for video..." >> ~/cvlog.txt
echo "libavcodec-dev" >> ~/cvlog.txt
sudo apt-get install -y libavcodec-dev
echo "libavformat-dev" >> ~/cvlog.txt
sudo apt-get install -y libavformat-dev
echo "libswscale-dev" >> ~/cvlog.txt
sudo apt-get install -y libswscale-dev
echo "libv4l-dev" >> ~/cvlog.txt
sudo apt-get install -y libv4l-dev
echo "libxvidcore-dev" >> ~/cvlog.txt
sudo apt-get install -y libxvidcore-dev
echo "libx264-dev" >> ~/cvlog.txt
sudo apt-get install -y libx264-dev
DATE=$(date)
echo "--> $DATE" >> ~/cvlog.txt
echo "---" >> ~/cvlog.txt
echo "Installing GTK development library..." >> ~/cvlog.txt
echo "libgtk2.0-dev" >> ~/cvlog.txt
sudo apt-get install -y libgtk2.0-dev
echo "libgtk-3-dev" >> ~/cvlog.txt
sudo apt-get install -y libgtk-3-dev
DATE=$(date)
echo "--> $DATE" >> ~/cvlog.txt
echo "---" >> ~/cvlog.txt
echo "Installing a few extra dependencies..." >> ~/cvlog.txt
echo "libatlas-base-dev" >> ~/cvlog.txt
sudo apt-get install -y libatlas-base-dev
echo "gfortran" >> ~/cvlog.txt
sudo apt-get install -y gfortran
DATE=$(date)
echo "--> $DATE" >> ~/cvlog.txt
echo "---" >> ~/cvlog.txt
echo "---" >> ~/cvlog.txt
echo "Installing Python 2.7 and Python 3 dev files..." >> ~/cvlog.txt
echo "python2.7-dev" >> ~/cvlog.txt
sudo apt-get install -y python2.7-dev
echo "python3-dev" >> ~/cvlog.txt
sudo apt-get install -y python3-dev
echo "---" >> ~/cvlog.txt
echo "---" >> ~/cvlog.txt
DATE=$(date)
echo "--> $DATE" >> ~/cvlog.txt
echo "Download and Extract OpenCV Files" >> ~/cvlog.txt
echo "---------------------------------" >> ~/cvlog.txt
echo "Downloading OpenCV Version $VERSION ..." >> ~/cvlog.txt
cd ~
echo "opencv.zip https://github.com/Itseez/opencv/archive/${VERSION}.zip" >> ~/cvlog.txt
wget -O opencv.zip https://github.com/Itseez/opencv/archive/${VERSION}.zip
echo "Downloading OpenCV Contrib Files Version $VERSION ..." >> ~/cvlog.txt
echo "wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/${VERSION}.zip" >> ~/cvlog.txt
wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/${VERSION}.zip
DATE=$(date)
echo "--> $DATE" >> ~/cvlog.txt
echo "Extract opencv..." >> ~/cvlog.txt
unzip opencv.zip
echo "Extract opencv_contrib..." >> ~/cvlog.txt
unzip opencv_contrib.zip
DATE=$(date)
echo "--> $DATE" >> ~/cvlog.txt
echo "---" >> ~/cvlog.txt
echo "---" >> ~/cvlog.txt
echo "Install Some Python Stuff" >> ~/cvlog.txt
echo "-------------------------" >> ~/cvlog.txt
echo "Download and install pip - Python package manager..." >> ~/cvlog.txt
echo "https://bootstrap.pypa.io/get-pip.py" >> ~/cvlog.txt
wget https://bootstrap.pypa.io/get-pip.py
echo "python get-pip.py" >> ~/cvlog.txt
sudo python get-pip.py
echo "python3 get-pip.py" >> ~/cvlog.txt
sudo python3 get-pip.py
echo "Installing python numpy..." >> ~/cvlog.txt
sudo pip install numpy
echo "Installing python3 numpy..." >> ~/cvlog.txt
sudo pip3 install numpy
DATE=$(date)
echo "--> $DATE" >> ~/cvlog.txt
echo "---" >> ~/cvlog.txt
echo "---" >> ~/cvlog.txt
echo "Configure, Build and install OpenCV" >> ~/cvlog.txt
echo "-------------------------" >> ~/cvlog.txt
echo "Create build directory, and jump in..." >> ~/cvlog.txt
cd ~/opencv-${VERSION}/
mkdir build
cd build
echo "Configure OpenCV with cmake..." >> ~/cvlog.txt
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DINSTALL_PYTHON_EXAMPLES=ON -DBUILD_EXAMPLES=ON -DOPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-${VERSION}/modules ..
DATE=$(date)
echo "--> $DATE" >> ~/cvlog.txt
echo "Building OpenCV $VERSION with $CPU_CORES CPU cores" >> ~/cvlog.txt
make -j ${CPU_CORES} || true
DATE=$(date)
echo "--> $DATE" >> ~/cvlog.txt
echo "Build any remaining code with single thread..." >> ~/cvlog.txt
make
DATE=$(date)
echo "--> $DATE" >> ~/cvlog.txt
echo "Installing OpenCV..." >> ~/cvlog.txt
sudo make install
sudo ldconfig
echo "---" >> ~/cvlog.txt
echo "---" >> ~/cvlog.txt
echo "------ OpenCV Installed------" >> ~/cvlog.txt
echo "---" >> ~/cvlog.txt
echo "Started: $STARTED" >> ~/cvlog.txt
DATE=$(date)
echo "Finished: $DATE" >> ~/cvlog.txt
echo "==========================================================" >> ~/cvlog.txt
echo "==========================================================" >> ~/cvlog.txt
echo "================================="
echo "================================="
echo "-------- OpenCV Installed--------"
echo "================================="
echo "Started: $STARTED"
echo "Finished: $DATE"

