echo "----------------------------"
echo "Updating"
echo "----------------------------"
sudo apt-get -y -q update
echo "----------------------------"
echo "Remove Anaconda"
echo "----------------------------"
sudo rm -rf /anaconda*
echo "----------------------------"
echo "Change File Encodings to Unix"
echo "----------------------------"
sudo apt-get -y -q install dos2unix
dos2unix tools/*
echo "----------------------------"
echo "Install and Configture vim"
echo "----------------------------"
sudo apt-get -y -q install vim
sudo cp tools/.vimrc /home/rachit/
echo "----------------------------"
echo "Setup Remote Connection Dependencies"
echo "----------------------------"
sudo apt-get install -y -q xfce4
sudo apt-get install -y -q xrdp
echo xfce4-session >~/.xsession
sudo service xrdp restart
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
libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler libopenblas-dev libatlas-base-dev python-tk
echo "----------------------------"
echo "Install pip"
echo "----------------------------"
sudo apt-get -y -q install python-pip
echo "----------------------------"
echo "Get Python Dependencies"
echo "----------------------------"
pip install -r tools/requirements.txt
echo "----------------------------"
echo "Clone Faster RCNN Code"
echo "----------------------------"
git clone --recursive https://github.com/rbgirshick/py-faster-rcnn.git
echo "----------------------------"
echo "Prep to Build Caffe"
echo "----------------------------"
sudo cp tools/MakefileAzure.config py-faster-rcnn/caffe-fast-rcnn/Makefile.config
sudo cp tools/MakefileAzure py-faster-rcnn/caffe-fast-rcnn/Makefile
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
echo "----------------------------"
echo "Remote Connection using RDP"
echo "----------------------------"
echo "Azure login using `azure login` and follow the prompts"
echo "Open Port 3389 for RDP requests"
echo "az vm open-port --resource-group myResourceGroup --name myVM --port 3389"
echo "Use Windows RDP to Connect to this Linux Node using the xfce4 gui"
