#!/usr/bin/env bash

cd $HOME

if [ ! -d "devstack" ]; then
	git clone https://git.openstack.org/openstack-dev/devstack.git devstack
else
	echo "Skipping clone of devstack for user stack"
fi

cd devstack
cp /vagrant/local.conf .
./stack.sh
