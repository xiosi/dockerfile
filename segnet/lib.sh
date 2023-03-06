/opt/conda/bin/python -m pip install --upgrade pip
sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list
apt update
#apt-get install -y dialog  apt-utils
apt-get install -y openssh-server
apt-get install -y net-tools
apt-get install -y tmux
apt-get install -y make

mkdir -p /var/run/sshd
mkdir -p mkdir/root/.ssh/
echo root:123456 | chpasswd
#maybe don't work
sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
systemctl enable ssh

echo 'install prtorch env'
pip3 install  -r /root/docker/requirements.txt
pip3 install scikit-image
apt-get install libglib2.0-0
apt install -y libsm6 libxext6
apt-get install -y libxrender-dev
#/bin/cp -f /root/docker/.condarc ~
#conda config --set ssl_verify no
#conda update anaconda-navigator
#conda init
#conda deactivate
#conda init
#conda deactivate
#cat ~/.condarc
#conda install -y -c anaconda cudatoolkit==9.0
conda install -y --insecure  pytorch torchvision cudatoolkit=9.2 -c pytorch
echo "export PATH=/opt/conda/bin:$PATH" >> ~/.bashrc
