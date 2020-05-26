#!/bin/bash
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum update -y

yum install mysql-server
systemctl start mysqld

mysql CREATE USER 'pamAdmin'@'%' IDENTIFIED BY 'S3cr3tK3y#';
mysql GRANT ALL ON *.* TO 'pamAdmin'@'%' IDENTIFIED BY 'S3cr3tK3y#';
mysql CREATE DATABASE COMGAS;

yum --enablerepo=epel -y install phpMyAdmin php-mysql php-mcrypt
systemctl restart httpd
