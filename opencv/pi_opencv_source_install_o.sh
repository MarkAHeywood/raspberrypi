FILE="pi_opencv_source_install_0.sh"
# Author:	Mark Heywood, 2017
# Date:		01 November 2017
# Website:	www.bluetin.com
# License:	MIT
# Version:	0.10
# Target: Python and C++

# This script installs OpenCV from source.
# The script is for the Raspberry Pi Hardware.
# Another script is available for the Raspberry Pi Desktop running in VirtualBox Virtual Machine and other x86 systems.
# The set up process will be logged in the $CVLOG.

# Set OpenCV version to install
VERSION=3.3.0
CVLOG="cv${VERSION}_install_log.txt"

# Exit the script on command error.
set -o errexit
# Get number of CPU cores in system.
CPU_CORES=$(grep -c ^processor /proc/cpuinfo)
# Get date.
DATE=$(date)
START=$(date)
TEMPCMD="/opt/vc/bin/vcgencmd measure_temp"
TEMP=$($TEMPCMD)
echo "==========================================================" >> ~/$CVLOG
echo "      Welcome To OpenCV $VERSION Install Script." >> ~/$CVLOG
echo "                By Mark Heywood, 2017" >> ~/$CVLOG
echo "                http://www.bluetin.io" >> ~/$CVLOG
echo "Download and install OpenCV $VERSION and its dependencies." >> ~/$CVLOG
echo "==========================================================" >> ~/$CVLOG
echo "File: $FILE" >> ~/$CVLOG
echo "Started: $DATE" >> ~/$CVLOG
echo "--> $TEMP" >> ~/$CVLOG
echo "CPU cores: $CPU_CORES" >> ~/$CVLOG
echo "---------------------------" >> ~/$CVLOG
echo "---------------------------" >> ~/$CVLOG
echo "Lets get the package lists up to date..." >> ~/$CVLOG
echo "> Run sudo apt-get update" >> ~/$CVLOG
sudo apt-get update
echo "---" >> ~/$CVLOG
DATE=$(date)
echo "--> $DATE" >> ~/$CVLOG
TEMP=$($TEMPCMD)
echo "--> $TEMP" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "Now installing dependencies" >> ~/$CVLOG
echo "---------------------------" >> ~/$CVLOG
echo "Installing developer tools to support OpenCV build process..." >> ~/$CVLOG
echo "> build-essential" >> ~/$CVLOG
sudo apt-get install -y build-essential
echo "> make" >> ~/$CVLOG
sudo apt-get install -y make
echo "> cmake" >> ~/$CVLOG
sudo apt-get install -y cmake
echo "> cmake-curses-gui" >> ~/$CVLOG
sudo apt-get install -y cmake-curses-gui
echo "> g++" >> ~/$CVLOG
sudo apt-get install -y g++
echo "> pkg-config" >> ~/$CVLOG
sudo apt-get install -y pkg-config
echo "---" >> ~/$CVLOG
DATE=$(date)
echo "--> $DATE" >> ~/$CVLOG
TEMP=$($TEMPCMD)
echo "--> $TEMP" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "Installing some packages for image processing..." >> ~/$CVLOG
echo "> libjpeg-dev" >> ~/$CVLOG
sudo apt-get install -y libjpeg-dev
echo "> libtiff5-dev" >> ~/$CVLOG
sudo apt-get install -y libtiff5-dev
echo "> libjasper-dev" >> ~/$CVLOG
sudo apt-get install -y libjasper-dev
echo "> libpng12-dev" >> ~/$CVLOG
sudo apt-get install -y libpng12-dev
echo "---" >> ~/$CVLOG
DATE=$(date)
echo "--> $DATE" >> ~/$CVLOG
TEMP=$($TEMPCMD)
echo "--> $TEMP" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "Installing packages for video..." >> ~/$CVLOG
echo "> libavcodec-dev" >> ~/$CVLOG
sudo apt-get install -y libavcodec-dev
echo "> libavformat-dev" >> ~/$CVLOG
sudo apt-get install -y libavformat-dev
echo "> libswscale-dev" >> ~/$CVLOG
sudo apt-get install -y libswscale-dev
echo "> libv4l-dev" >> ~/$CVLOG
sudo apt-get install -y libv4l-dev
echo "> libxvidcore-dev" >> ~/$CVLOG
sudo apt-get install -y libxvidcore-dev
echo "> libx264-dev" >> ~/$CVLOG
sudo apt-get install -y libx264-dev
echo "> libavutil-dev" >> ~/$CVLOG
sudo apt-get install -y libavutil-dev
echo "---" >> ~/$CVLOG
DATE=$(date)
echo "--> $DATE" >> ~/$CVLOG
TEMP=$($TEMPCMD)
echo "--> $TEMP" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "Installing GTK development library..." >> ~/$CVLOG
echo "> libgtk2.0-dev" >> ~/$CVLOG
sudo apt-get install -y libgtk2.0-dev
echo "> libgtk-3-dev" >> ~/$CVLOG
sudo apt-get install -y libgtk-3-dev
echo "---" >> ~/$CVLOG
DATE=$(date)
echo "--> $DATE" >> ~/$CVLOG
TEMP=$($TEMPCMD)
echo "--> $TEMP" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "Installing a few extra dependencies..." >> ~/$CVLOG
echo "> libatlas-base-dev" >> ~/$CVLOG
sudo apt-get install -y libatlas-base-dev
echo "> gfortran" >> ~/$CVLOG
sudo apt-get install -y gfortran
echo "> libeigen3-dev" >> ~/$CVLOG
sudo apt-get install -y libeigen3-dev
echo "> libglew1.6-dev" >> ~/$CVLOG
sudo apt-get install -y libglew1.6-dev
echo "---" >> ~/$CVLOG
DATE=$(date)
echo "--> $DATE" >> ~/$CVLOG
TEMP=$($TEMPCMD)
echo "--> $TEMP" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "Installing Python 2.7 and Python 3 dev files..." >> ~/$CVLOG
echo "> python2.7-dev" >> ~/$CVLOG
sudo apt-get install -y python2.7-dev
echo "> python3-dev" >> ~/$CVLOG
sudo apt-get install -y python3-dev
echo "---" >> ~/$CVLOG
DATE=$(date)
echo "--> $DATE" >> ~/$CVLOG
TEMP=$($TEMPCMD)
echo "--> $TEMP" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "Download and Extract OpenCV Files" >> ~/$CVLOG
echo "---------------------------------" >> ~/$CVLOG
echo "Downloading OpenCV Version $VERSION ..." >> ~/$CVLOG
cd ~
echo "> opencv.zip https://github.com/Itseez/opencv/archive/${VERSION}.zip" >> ~/$CVLOG
wget -O opencv.zip https://github.com/Itseez/opencv/archive/${VERSION}.zip
echo "Downloading OpenCV Contrib Files Version $VERSION ..." >> ~/$CVLOG
echo "> opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/${VERSION}.zip" >> ~/$CVLOG
wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/${VERSION}.zip
echo "---" >> ~/$CVLOG
DATE=$(date)
echo "--> $DATE" >> ~/$CVLOG
TEMP=$($TEMPCMD)
echo "--> $TEMP" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "> Extract opencv..." >> ~/$CVLOG
unzip opencv.zip
echo "> Extract opencv_contrib..." >> ~/$CVLOG
unzip opencv_contrib.zip
echo "---" >> ~/$CVLOG
DATE=$(date)
echo "--> $DATE" >> ~/$CVLOG
TEMP=$($TEMPCMD)
echo "--> $TEMP" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "Install Some Python Stuff" >> ~/$CVLOG
echo "-------------------------" >> ~/$CVLOG
echo "Download and install pip - Python package manager..." >> ~/$CVLOG
echo "> https://bootstrap.pypa.io/get-pip.py" >> ~/$CVLOG
wget https://bootstrap.pypa.io/get-pip.py
echo "> python get-pip.py" >> ~/$CVLOG
sudo python get-pip.py
echo "> python3 get-pip.py" >> ~/$CVLOG
sudo python3 get-pip.py
echo "> Installing python numpy..." >> ~/$CVLOG
sudo pip install numpy
echo "> Installing python3 numpy..." >> ~/$CVLOG
sudo pip3 install numpy
echo "---" >> ~/$CVLOG
DATE=$(date)
echo "--> $DATE" >> ~/$CVLOG
TEMP=$($TEMPCMD)
echo "--> $TEMP" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "Configure, Build and install OpenCV" >> ~/$CVLOG
echo "-----------------------------------" >> ~/$CVLOG
echo "Create build directory, and jump in..." >> ~/$CVLOG
cd ~/opencv-${VERSION}/
mkdir build
cd build
echo "Configure OpenCV with cmake..." >> ~/$CVLOG
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DINSTALL_PYTHON_EXAMPLES=ON -DINSTALL_C_EXAMPLES=ON -DBUILD_TESTS=OFF -DENABLE_NEON=ON -DENABLE_VFPV3=ON -DBUILD_EXAMPLES=ON -DOPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-${VERSION}/modules ..
echo "---" >> ~/$CVLOG
DATE=$(date)
echo "--> $DATE" >> ~/$CVLOG
TEMP=$($TEMPCMD)
echo "--> $TEMP" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
# Uncomment the next six lines for multi-core processor build. Warning - build could fail.
#echo "Building OpenCV $VERSION with $CPU_CORES CPU cores" >> ~/$CVLOG
#make -j ${CPU_CORES} || true
#DATE=$(date)
#echo "--> $DATE" >> ~/$CVLOG
#TEMP=$($TEMPCMD)
#echo "--> $TEMP" >> ~/$CVLOG
# This will also build files that failed to build during multi-core processor build, if used.
echo "---" >> ~/$CVLOG
echo "Build OpenCV with single core..." >> ~/$CVLOG
make
echo "---" >> ~/$CVLOG
DATE=$(date)
echo "--> $DATE" >> ~/$CVLOG
TEMP=$($TEMPCMD)
echo "--> $TEMP" >> ~/$CVLOG
echo "---" >> ~/$CVLOG
echo "Installing OpenCV..." >> ~/$CVLOG
sudo make install
sudo ldconfig
echo "---" >> ~/$CVLOG
echo "-----------------------------" >> ~/$CVLOG
echo "------ OpenCV Installed------" >> ~/$CVLOG
echo "-----------------------------" >> ~/$CVLOG
echo "Started: $START" >> ~/$CVLOG
DATE=$(date)
echo "Finished: $DATE" >> ~/$CVLOG
TEMP=$($TEMPCMD)
echo "--> $TEMP" >> ~/$CVLOG
echo "==========================================================" >> ~/$CVLOG
echo "==========================================================" >> ~/$CVLOG
echo "================================="
echo "================================="
echo "-------- OpenCV Installed--------"
echo "================================="
echo "Started: $START"
echo "Finished: $DATE"
TEMP=$($TEMPCMD)
echo "--> $TEMP"

