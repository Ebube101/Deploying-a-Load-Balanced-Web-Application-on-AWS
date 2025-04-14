## 📁 `docs/configure-asg.md`

```markdown
# Configure Auto Scaling Group (ASG)

This guide shows how to configure Auto Scaling to maintain high availability.

## ✅ Prerequisites:
- Launch Template created with EC2 setup
- Target Group ready (used by ALB)

## ✅ Steps:

### 1. Create Auto Scaling Group
- Use your Launch Template
- VPC: Select your VPC
- Subnets: Select private subnets (2 AZs)
- Attach to your existing Target Group
- Desired capacity: 2
- Min: 2, Max: 4

### 2. Health Checks
- Set type to EC2
- Grace period: 300 seconds

### 3. Scaling Policies (Optional)
- Use target tracking policy based on CPU if required

### 4. Test Auto Scaling
- Terminate one instance manually
- Watch a new one be created
- Verify it joins the target group and is marked healthy

### 5. Monitor with ALB
- Refresh your ALB public DNS
- Verify load balancing works with the new instance
```