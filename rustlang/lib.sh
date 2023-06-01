sed -i "s@http://\(deb\|security\).debian.org@https://mirrors.tencent.com@g" /etc/apt/sources.list
apt-get -o Acquire::Check-Valid-Until=false update
apt update
apt-get install -y openssh-server
apt-get install -y tmux
apt-get install -y wget
mkdir -p /var/run/sshd
mkdir -p mkdir/root/.ssh/
echo root:123456 | chpasswd
sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
systemctl enable ssh
