#!/bin/bash
# update linux package
sudo yum update -y
# installing lamp stack
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
#  cats the OS identification data. Can probably be removed
cat /etc/system-release
# installing MariaDB
sudo yum install -y httpd mariadb-server
# starting MAriaDB
sudo systemctl start mariadb
# Logs into mysql/mariadb as root
mysql -u root 
# Sets password for the root account
UPDATE mysql.user SET Password=PASSWORD('$rootpass') WHERE User='root';
# Deleting root user for local host
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', 'x.0.0.x', '::1');
# Deleting annonymous user
DELETE FROM mysql.user WHERE User='';
# Deleting test database
DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
CREATE USER 'test' identified by 'newpassword';
create user 'bbb' identified by 'company123';
# Grant priviliges to user "bbb"
grant select on *.* to bbb;
FLUSH PRIVILEGES;
# Review users
SELECT USER,host from mysql.user;
CREATE DATABASE companudatabase;
SHOW DATABASES;
exit



  
