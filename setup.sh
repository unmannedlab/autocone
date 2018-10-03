sudo apt-get update
sudo apt-get upgrade -y
sudo apt-autoremove

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install ros-kinetic-desktop-full

sudo rosdep init
sudo rosdep fix-permissions
rosdep update

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential

sudo apt-get install python-pip -y
sudo apt-get install python-dev -y
sudo pip install future

sudo pip install screen
sudo pip install wxgtk3.0
sudo pip install python-matplotlib
sudo pip install python-opencv
sudo pip install python-numpy
sudo pip install libxml2-dev
sudo pip install libxslt-dev
sudo pip install pyserial
sudo pip install dronekit
sudo pip install multiprocessing
sudo pip install socket
sudo pip install geopy


export ROS_MASTER_URI=http://Blade:11311/
sudo reboot
