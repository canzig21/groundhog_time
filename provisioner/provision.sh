#!/bin/bash
set -e
sudo apt-get clean
sudo apt-get update
sudo apt -y install python3
sudo apt-get clean
sudo apt-get update
sudo apt -y install python3-pip
sudo apt-get clean
sudo apt-get update
sudo apt -y install nginx
sudo apt-get clean
sudo apt-get update
sudo apt -y install git
sudo rm /etc/nginx/sites-enabled/default 
sudo mkdir /var/time
wget https://groundhog-hc-canzig-appcode.s3.amazonaws.com/time.py
sudo mv time.py /var/time/
sudo chmod 755 /var/time/time.py
wget https://groundhog-hc-canzig-appcode.s3.amazonaws.com/python_time.conf
sudo cp python_time.conf /etc/nginx/conf.d/python_time.conf
sudo nginx -s reload
sudo localectl set-locale LANG=en_US.utf8
sudo pip3 install flask-rest-jsonapi flask-sqlalchemy flask-cors
wget https://groundhog-hc-canzig-appcode.s3.amazonaws.com/boottime.sh
sudo mv boottime.sh /root/boottime.sh
sudo chmod +x /root/boottime.sh
wget https://groundhog-hc-canzig-appcode.s3.amazonaws.com/boottime.service
sudo mv boottime.service /etc/systemd/system/boottime.service
sudo systemctl enable boottime
sudo systemctl start boottime
echo "Running build."