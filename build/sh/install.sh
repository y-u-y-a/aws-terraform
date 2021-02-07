#!/bin/sh

sudo yum update -y
# Install Library
sudo yum install -y git mysql httpd
sudo systemctl start httpd.service
# html作成
sudo touch /var/www/html/index.html
sudo chmod 755 /var/www/html/index.html
sudo sh -c "echo `hostname --ip-address` > /var/www/html/index.html"
