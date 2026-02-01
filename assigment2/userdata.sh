#!/bin/bash

# Update packages
sudo yum update -y

# Install nginx
sudo amazon-linux-extras install nginx1 -y

# Start nginx
sudo systemctl start nginx

# Enable nginx to start on boot
sudo systemctl enable nginx

# Add a custom webpage
echo "<h1>Welcome to Terraform Assignment 2 - NGINX</h1>" | sudo tee /usr/share/nginx/html/index.html
