/opt/conda/bin/python -m pip install --upgrade pip
sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list
apt update
apt-get install -y dialog  apt-utils
apt-get install -y openssh-server
apt-get install -y net-tools

mkdir -p /var/run/sshd
mkdir -p mkdir/root/.ssh/
echo root:123456 | chpasswd
#maybe don't work
sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
systemctl enable ssh

pip3 install git+https://gitee.com/wsyin/cocoapi.git#subdirectory=PythonAPI
pip3 install  -r /root/fastfcn/requirements.txt
