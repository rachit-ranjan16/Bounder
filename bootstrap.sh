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
echo "Install pip"
echo "----------------------------"
sudo apt-get -y -q install python-pip
# echo "----------------------------"
# echo "Install pyenv"
# echo "----------------------------"
# sudo apt-get -y -q install python3-venv
# echo "----------------------------"
# echo "Create and Activate Virtual Environment"
# echo "----------------------------"
# pyvenv developEnv
# source developEnv/bin/activate
# pip install --upgrade pip
echo "----------------------------"
echo "Install Specified Dependencies in Local Python 2.7"
echo "----------------------------"
pip install -r /vagrant_data/requirements.txt
echo "----------------------------"
echo "Install and configure git"
echo "----------------------------"
sudo apt-get -y -q install git
git config --global user.name "rachit.ranjan16" #Enter Git Username here - MANDATORY
git config --global user.email "rachit.ranjan93@gmail.com" #Enter Git Email here - MANDATORY
echo "----------------------------"
echo "Install Caffe-cpu"
echo "----------------------------"
sudo apt-get -y -q install caffe-cpu
echo "----------------------------"
echo "Clone Caffe Code"
echo "----------------------------"
mkdir Development
cd Development
git clone --recursive https://github.com/rbgirshick/py-faster-rcnn.git
# echo "----------------------------"
# echo "Move Modified Makefile.config to cafe-fast-rcnn"
# echo "----------------------------"
# cd py-faster-rcnn.git
