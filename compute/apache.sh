#!/bin/bash
yum update -y
yum install httpd -y
cd /var/www/html
echo "<html><body><h1> This is your automated Apache EC2 instance" > index.html
systemctl restart httpd
systemctl enable httpd
