#!/bin/bash
yum -y update
yum -y install unzip
yum -y install maven
yum -y install git
yum -y install java-1.8.0-openjdk-devel
cd /vagrant && ./pam-setup.sh -n localhost:8080 -b both
chown -R vagrant:vagrant /vagrant
nohup sh /vagrant/go_pam.sh &
