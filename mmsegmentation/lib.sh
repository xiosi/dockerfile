#/opt/conda/bin/python -m pip install --upgrade pip
sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list
apt update
#apt-get install -y dialog  apt-utils
apt-get install -y openssh-server
apt-get install -y net-tools
apt-get install -y tmux
apt-get install -y make
apt-get install -y git ninja-build libglib2.0-0 libsm6 libxrender-dev libxext6 libgl1-mesa-glx
apt-get clean
rm -rf /var/lib/apt/lists/*

mkdir -p /var/run/sshd
mkdir -p mkdir/root/.ssh/
echo root:w123 | chpasswd
#maybe don't work
sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
#systemctl enable ssh


