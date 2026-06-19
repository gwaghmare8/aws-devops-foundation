#!/bin/bash
sudo yum update -y
sudo yum install -y nginx
systemctl start nginx
systemctl enable nginx
echo "Hello from DevOps Foundtation Project" > /usr/share/nginx/html/index.html