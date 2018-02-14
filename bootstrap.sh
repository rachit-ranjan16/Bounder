echo "----------------------------"
echo "Updating"
echo "----------------------------"
sudo apt-get -y -q update
echo "----------------------------"
echo "Install and Configture vim"
echo "----------------------------"
sudo apt-get -y -q install vim
sudo cp /vagrant_data/.vimrc /home/ubuntu
sudo cp /vagrant_data/.vimrc /root/
echo "----------------------------"
echo "Install and configure git"
echo "----------------------------"
sudo apt-get -y -q install git
git config --global user.name "rachit.ranjan16"
git config --global user.email "rachit.ranjan93@gmail.com"
echo "----------------------------"
echo "Install Caffe Dependencies"
echo "----------------------------"
sudo apt-get -y -q install --no-install-recommends libboost-all-dev
sudo apt-get -y -q install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev \
libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler
echo "----------------------------"
echo "Install pip"
echo "----------------------------"
sudo apt-get -y -q install python-pip
echo "----------------------------"
echo "Get Python Dependencies"
echo "----------------------------"
pip install scikit-image protobuf
pip install -r /vagrant_data/requirements.txt
echo "----------------------------"
echo "Clone Faster RCNN Code"
echo "----------------------------"
git clone --recursive https://github.com/rbgirshick/py-faster-rcnn.git
echo "----------------------------"
echo "Prep to Build Cython Lib Modules"
echo "----------------------------"
sudo cp /vagrant_data/libSetup.py py-faster-rcnn/lib/setup.py
echo "----------------------------"
echo "Prep to Build Caffe"
echo "----------------------------"
sudo cp /vagrant_data/Makefile.config py-faster-rcnn/caffe-fast-rcnn/Makefile.config
echo "----------------------------"
echo "Create Soft Links"
echo "----------------------------"
sudo ln -s /usr/lib/x86_64-linux-gnu/libhdf5_serial.so.10.1.0 /usr/lib/x86_64-linux-gnu/libhdf5.so
sudo ln -s /usr/lib/x86_64-linux-gnu/libhdf5_serial_hl.so.10.0.2 /usr/lib/x86_64-linux-gnu/libhdf5_hl.so
echo "----------------------------"
echo "Build lib"
echo "----------------------------"
cd py-faster-rcnn/lib/
sudo make
echo "----------------------------"
echo "Build Caffe"
echo "----------------------------"
cd ../caffe-fast-rcnn
sudo make && make pycaffe
