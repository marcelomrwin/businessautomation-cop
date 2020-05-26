#!/bin/bash
yum --enablerepo=centos-sclo-rh -y install rh-mysql57-mysql-server
scl enable rh-mysql57 bash
mysql -V
which mysql

echo "source /opt/rh/rh-mysql57/enable" >> /etc/profile.d/rh-mysql57.sh
echo "export X_SCLS=\"`scl enable rh-mysql57 'echo $X_SCLS'`\"" >> /etc/profile.d/rh-mysql57.sh

yum --enablerepo=epel -y install phpMyAdmin php-mysql php-mcrypt
systemctl restart httpd
