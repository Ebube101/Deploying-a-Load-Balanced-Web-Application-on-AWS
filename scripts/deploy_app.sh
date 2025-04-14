#!/bin/bash

# Ensure nginx is installed and running
sudo systemctl start nginx
sudo systemctl enable nginx

# Create the PHP app
cat <<EOF | sudo tee /usr/share/nginx/html/index.php
<?php
echo "<h1>Hello from " . gethostname() . "</h1>";
?>
EOF

# Update the Nginx config to serve PHP files
sudo bash -c 'cat > /etc/nginx/conf.d/default.conf <<EOF
server {
    listen       80;
    server_name  localhost;

    root         /usr/share/nginx/html;
    index        index.php index.html index.htm;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~ \.php\$ {
        include        fastcgi_params;
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  \$document_root\$fastcgi_script_name;
    }

    error_page 404 /404.html;
    location = /404.html {
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
    }
}
EOF'

# Restart nginx to apply changes
sudo systemctl restart nginx
