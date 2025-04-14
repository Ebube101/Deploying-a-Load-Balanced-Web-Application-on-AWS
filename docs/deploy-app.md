## 📁 `docs/deploy-app.md`

```markdown
# Deploy App on EC2

This guide explains how to install NGINX and deploy a simple PHP app that displays the hostname of each instance.

## ✅ Requirements:
- Amazon Linux 2 AMI
- Instances launched in private subnets
- Access via bastion host or Session Manager

## ✅ Steps:

### 1. SSH into the EC2 instance (via bastion host or SSM)
```bash
ssh -i "your-key.pem" ec2-user@<private-ip>
```

### 2. Update packages and install NGINX + PHP
```bash
sudo yum update -y
sudo amazon-linux-extras enable php7.4
sudo yum install nginx php php-fpm -y
```

### 3. Create simple app
```bash
echo "<?php echo gethostname(); ?>" | sudo tee /usr/share/nginx/html/index.php
```

### 4. Configure NGINX (if needed)
Ensure `index.php` is added in the config under the `server` block:
```nginx
index index.php index.html index.htm;
```

Restart NGINX:
```bash
sudo systemctl enable nginx
sudo systemctl start nginx
```


