apt-get update
locale-gen en_US.UTF-8
export LC_ALL='en_US.UTF-8'
echo "export LC_ALL=en_US.UTF-8" >> /root/.profile
echo 'root:docker' |chpasswd
mkdir -p ${HOME}/.ssh/
apt-get install -y openssh-server
mkdir /var/run/sshd
