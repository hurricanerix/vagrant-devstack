#!/usr/bin/env bash
sudo apt-get update
sudo apt-get -y upgrade

if [ ! -d "devstack" ]; then
	git clone https://git.openstack.org/openstack-dev/devstack.git devstack
else
	echo "Skipping clone of devstack for user ubuntu"
fi

sudo HOST_IP=10.0.2.5 ./devstack/tools/create-stack-user.sh
sudo -u stack -H sh -c "sh /vagrant/bootstrap/user-stack.sh"
