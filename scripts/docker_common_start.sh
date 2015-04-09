apt-get update
locale-gen en_US.UTF-8
export LC_ALL='en_US.UTF-8'
echo "export LC_ALL=en_US.UTF-8" >> /root/.profile
echo "export TERM=xterm" >> /root/.profile
echo 'root:docker' |chpasswd
mkdir -p ${HOME}/.ssh/
apt-get install -y apt-utils
apt-get install -y openssh-server
apt-get install -y curl
mkdir /var/run/sshd
