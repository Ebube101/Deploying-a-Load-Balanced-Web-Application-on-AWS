## 📁 `docs/setup-alb.md`

```markdown
# Setup Application Load Balancer (ALB)

This guide shows how to set up an Application Load Balancer that distributes traffic across EC2 instances in private subnets.

## ✅ Steps:

### 1. Create Target Group
- Target type: Instances
- Protocol: HTTP
- Port: 80
- Health checks: HTTP → `/`

### 2. Create Application Load Balancer
- Type: Application
- Scheme: Internet-facing
- Subnets: Select 2 public subnets
- Security Group: Allow inbound on port 80 (HTTP)

### 3. Register EC2 Instances
- Add the two EC2 instances to the target group

### 4. Test ALB
Visit the DNS name (e.g.):
```
http://<your-alb-dns>
```
- You should see the hostname of different instances on refresh
```

