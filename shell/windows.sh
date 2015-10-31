#!/bin/bash
sudo cat >/etc/apt/sources.list << EOL
deb http://ubuntu.mirror.lrz.de/ubuntu trusty main restricted universe multiverse
deb http://ubuntu.mirror.lrz.de/ubuntu trusty-updates main restricted universe multiverse
deb http://ubuntu.mirror.lrz.de/ubuntu trusty-security main restricted universe multiverse
EOL
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install python-setuptools python-pip python-pycurl
#sudo pip install ansible
sudo apt-get -y install ansible
sudo chmod -x /vagrant/ansible/development
export ANSIBLE_NOCOWS=1
sudo ansible-playbook /vagrant/ansible/development.yml -i /vagrant/ansible/development_windows --connection=local