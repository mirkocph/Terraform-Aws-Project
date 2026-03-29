# Terraform AWS Infrastructure

A Terraform project that simulates a real enterprise infrastructure on AWS.

## Architecture

- **VPC** with public and private subnets
- **EC2** instances with Apache via Auto Scaling Group
- **RDS** MySQL in the private subnet
- **Application Load Balancer** to distribute traffic
- **CloudWatch** for CPU monitoring and automatic scaling

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured
- AWS Account

## Usage
```bash
# Initialize Terraform
terraform init

# Preview changes
terraform plan -var="db_password=YourPassword"

# Deploy infrastructure
terraform apply -var="db_password=YourPassword"

# Destroy everything
terraform destroy -var="db_password=YourPassword"
```

## Resources

| Resource | Details |
|----------|---------|
| VPC | 10.0.0.0/16 |
| Public Subnet | 10.0.1.0/24 |
| Private Subnet | 10.0.2.0/24 |
| EC2 | t3.micro - Amazon Linux 2 |
| RDS | MySQL 8.0 - db.t3.micro |
| ALB | Application Load Balancer |
| ASG | Min 1 - Max 4 instances |

## How It Works

1. The **ALB** receives incoming traffic on port 80
2. Traffic is distributed across **EC2** instances in the Auto Scaling Group
3. **CloudWatch** monitors CPU usage and triggers scaling:
   - CPU > 70% → adds an instance
   - CPU < 30% → removes an instance
4. **RDS** is isolated in the private subnet, accessible only by EC2 instances

