#!/bin/bash
yum -y install wget
yum -y install epel-release
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum update -y

yum -y install mysql-server
systemctl start mysqld

#mysql CREATE USER 'pamAdmin'@'%' IDENTIFIED BY 'S3cr3tK3y#';
#mysql GRANT ALL ON *.* TO 'pamAdmin'@'%' IDENTIFIED BY 'S3cr3tK3y#';
#mysql CREATE DATABASE COMGAS;

yum -y install httpd
yum -y install phpmyadmin
systemctl restart httpd
