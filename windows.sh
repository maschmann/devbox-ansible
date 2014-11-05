#!/bin/bash
sudo apt-get update
sudo apt-get install -y python-software-properties
sudo easy_install pip
sudo pip install ansible
sudo chmod -x /vagrant/ansible/development
export ANSIBLE_NOCOWS=1
sudo ansible-playbook /vagrant/ansible/development.yml -i /vagrant/ansible/development_windows --connection=local
