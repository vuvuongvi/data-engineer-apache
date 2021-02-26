#!/bin/bash
sudo useradd zk -m
# set bash is default shell
sudo usermod --shell /bin/bash zk
echo "zk:vuvuongvi1996" | chpasswd
# set sudo permission to zk user
usermod -aG sudo zk
# chmod folder sshd_config
sudo chmod -R 777 /etc/ssh/ssh_config
sudo echo "PermitRootLogin no" >> /etc/ssh/ssh_config
sudo echo "DenyUsers zk" >> /etc/ssh/ssh_config
# Install openssh-server
apt-get purge -y openssh-server
apt-get install -y openssh-server
# restart ssh server
systemctl restart sshd
systemctl restart ssh
# Switch to use zk user
su -l zk
mkdir -p /data/zookeeper
chown zk:zk /data/zookeeper
# # Change location to opt folder
# cd /opt
# sudo wget http://apache.osuosl.org/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz
# sudo tar -xvf zookeeper-3.4.13.tar.gz
# # Give permission for zk user to zookeeper folder
# sudo chown zk:zk -R  zookeeper-3.4.13
# # Give symbolic link zookeeper
# sudo ln -s zookeeper-3.4.13 zookeeper
# sudo chown -h zk:zk zookeeper
# # Create a configuration file named zoo.cfg
# sudo cp ./zoo.cfg ~/opt/zookeeper/conf
# # Move back to zookeeper directory
# cd /opt/zookeeper
# bin/zkServer.sh start
