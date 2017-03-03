#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y upgrade

sudo mkdir -p /opt/stack
sudo chown -R $USER:$USER /opt/stack
cd /opt/stack

if [ ! -d "devstack" ]; then
	git clone https://git.openstack.org/openstack-dev/devstack.git devstack
else
	echo "Skipping clone of devstack for user ubuntu"
fi

cd devstack
sudo STACK_USER=$USER HOST_IP=10.0.2.5 ./tools/create-stack-user.sh

cp /vagrant/local.conf .
STACK_USER=$USER ./stack.sh
