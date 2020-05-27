#!/bin/bash

yum -y install wget
yum -y install epel-release
yum -y update
yum -y install unzip
yum -y install maven
yum -y install git
yum -y install java-1.8.0-openjdk-devel

wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum update -y

yum -y install mysql-server
systemctl start mysqld

#CREATE USER 'pamAdmin'@'%' IDENTIFIED BY 'S3cr3tK3y#';
#GRANT ALL ON *.* TO 'pamAdmin'@'%' IDENTIFIED BY 'S3cr3tK3y#';
#CREATE DATABASE COMGAS;

yum -y install httpd
yum -y install phpmyadmin
systemctl restart httpd

cd /vagrant && ./pam-setup.sh -n localhost:8080 -b both
chown -R vagrant:vagrant /vagrant
nohup sh /vagrant/go_pam.sh &
