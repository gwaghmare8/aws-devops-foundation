#!/bin/bash
sudo yum update -y

# Install nginx
sudo yum install -y nginx
systemctl start nginx
systemctl enable nginx
echo "Hello from DevOps Foundtation Project" > /usr/share/nginx/html/index.html

# Install SSM Agent
sudo yum install -y amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent