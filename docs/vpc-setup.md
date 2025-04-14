Here's the suggested content for your documentation files under the `docs/` folder. These will form the full written walkthroughs for each major part of your AWS cloud infrastructure project.

---

## 📁 `docs/setup-vpc.md`

```markdown
# Setup VPC

This guide walks through setting up a custom Virtual Private Cloud (VPC) with public and private subnets to host a scalable, load-balanced web application.

## ✅ Steps:

1. **Create a VPC**
   - CIDR block: `10.0.0.0/16`
   - Enable DNS hostnames and resolution

2. **Create Subnets**
   - Public Subnet 1: `10.0.0.0/24` (e.g., eu-north-1a)
   - Public Subnet 2: `10.0.3.0/24` (e.g., eu-north-1b)
   - Private Subnet 1: `10.0.1.0/24`
   - Private Subnet 2: `10.0.2.0/24`

3. **Create Internet Gateway (IGW)**
   - Attach it to your VPC

4. **Create Route Tables**
   - Public route table:
     - Associate it with public subnets
     - Add route: `0.0.0.0/0 → Internet Gateway`
   - Private route table:
     - Associate it with private subnets
     - Add route: `0.0.0.0/0 → NAT Gateway` (after creating one)

5. **Create NAT Gateway**
   - Allocate Elastic IP
   - Launch NAT Gateway in one public subnet
   - Update private route table to point `0.0.0.0/0 → NAT Gateway`

6. **Security Groups**
   - Allow SSH (port 22) from your IP for bastion host
   - Allow HTTP (port 80) for Load Balancer
```



