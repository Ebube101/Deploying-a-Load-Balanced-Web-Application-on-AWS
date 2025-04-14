#!/bin/bash

# Update package repository
sudo yum update -y

# Install Nginx
sudo amazon-linux-extras enable nginx1
sudo yum install -y nginx

# Start and enable Nginx service
sudo systemctl start nginx
sudo systemctl enable nginx

# Install PHP and dependencies
sudo amazon-linux-extras enable php8.0
sudo yum clean metadata
sudo yum install -y php php-fpm

# Start and enable PHP-FPM service
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

# Adjust permissions
sudo chown -R nginx:nginx /usr/share/nginx/html
