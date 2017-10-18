# Exit the script on command error.
set -o errexit

# Set OpenCV version to install
VERSION=3.3.0

echo "Welcome to OpenCV $VERSION install script."
echo "Download and install OpenCV $VERSION and Its dependencies."
echo "The install process can take hours to install, your system performance being a factor."

echo "Lets get the system packages upto date..."
sudo apt-get -y update

echo "Now installing dependencies"
echo "Installing developer tools to support OpenCV build process..."
sudo apt-get -y install build-essential cmake pkg-config
echo "Installing some packages for images..."
sudo apt-get -y install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev
echo "installing packages for video..."
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get -y install libxvidcore-dev libx264-dev
echo "Installing GTK development library..."
sudo apt-get -y install libgtk2.0-dev libgtk-3-dev
echo "Installing a few extra dependencies..."
sudo apt-get -y install libatlas-base-dev gfortran
echo "Installing Python 2.7 and Python 3 header files..."
sudo apt-get -y install python2.7-dev python3-dev
echo "Downloading OpenCV $VERSION and extract..."
cd ~
wget -O opencv.zip https://github.com/Itseez/opencv/archive/${VERSION}.zip
unzip opencv.zip
echo "Downloading opencv_contrib files, and extract..."
wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/${VERSION}.zip
unzip opencv_contrib.zip
echo "Download and install pip - Python package manager..."
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo python3 get-pip.py
echo "Installing numpy..."
sudo pip install numpy
echo "Create build directory, and jump in..."
cd ~/opencv-${VERSION}/
mkdir build
cd build
echo "Configure OpenCV with cmake..."
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DINSTALL_PYTHON_EXAMPLES=ON -DBUILD_EXAMPLES=ON -DOPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-${VERSION}/modules ..
CPU_CORES=$(grep -c ^processor /proc/cpuinfo)
echo "Building OpenCV $VERSION with $CPU_CORES CPU cores"
make -j ${CPU_CORES} || true
echo "Build any remaining code with single thread..."
make
echo "Installing OpenCV $VERSION to system folder"
sudo make install
sudo ldconfig
echo "OpenCV $VERSION installed"

