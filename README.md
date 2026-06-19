# AWS DevOps Foundation Project

This repository is a long-term AWS infrastructure project built with Terraform. The goal is to grow one reusable platform over time while learning how to provision, secure, monitor, and automate cloud resources.

## Project Roadmap

We are building this repository in phases and will continue improving it over the coming weeks.

- ✅ **Phase 1** – VPC + EC2 *(completed)*
- 🚧 **Phase 2** – Private subnet + NAT Gateway + RDS
- 🔜 **Phase 3** – ALB + Auto Scaling
- 🔜 **Phase 4** – IAM + Secrets Manager + SSM
- 🔜 **Phase 5** – GitHub Actions + Terraform validation
- 🔜 **Phase 6** – CloudWatch + New Relic + Grafana
- 🔜 **Phase 7** – Modular Terraform refactor
- 🔜 **Phase 8** – Production hardening (remote state, locking, reusable modules)

## Current Status

The repository currently includes the setup for **Phase 1**, which provisions:

- 1 VPC
- 1 public subnet
- 1 internet gateway
- 1 public route table
- 1 security group allowing HTTP (80) and SSH (22)
- 1 EC2 instance running Amazon Linux
- A user data script that installs and starts NGINX

This means the current setup is a basic public-facing infrastructure example that demonstrates networking, EC2 deployment, and bootstrap configuration.

## Repository Structure

```text
.
├── docs/
├── scripts/
├── terraform/
│   ├── phase-1-vpc-ec2/
│   └── phase-2-networking/
└── README.md
```

## Phase 1 Terraform Files

- [terraform/phase-1-vpc-ec2/ec2.tf](terraform/phase-1-vpc-ec2/ec2.tf) — EC2 instance configuration
- [terraform/phase-1-vpc-ec2/vpc.tf](terraform/phase-1-vpc-ec2/vpc.tf) — VPC configuration
- [terraform/phase-1-vpc-ec2/subnets.tf](terraform/phase-1-vpc-ec2/subnets.tf) — public subnet configuration
- [terraform/phase-1-vpc-ec2/route_table.tf](terraform/phase-1-vpc-ec2/route_table.tf) — route table and association
- [terraform/phase-1-vpc-ec2/sg.tf](terraform/phase-1-vpc-ec2/sg.tf) — security group rules
- [terraform/phase-1-vpc-ec2/variables.tf](terraform/phase-1-vpc-ec2/variables.tf) — variable definitions
- [terraform/phase-1-vpc-ec2/outputs.tf](terraform/phase-1-vpc-ec2/outputs.tf) — Terraform outputs
- [terraform/phase-1-vpc-ec2/README.md](terraform/phase-1-vpc-ec2/README.md) — detailed phase 1 documentation

## Prerequisites

Before running the Terraform configuration, make sure you have:

- An AWS account and AWS CLI access configured
- Terraform installed locally
- A valid EC2 key pair created in AWS
- Permission to create EC2, VPC, subnet, route table, and security group resources

## Getting Started

1. Navigate to the phase 1 directory:
   ```bash
   cd terraform/phase-1-vpc-ec2
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Review the deployment plan:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

5. Check outputs:
   ```bash
   terraform output
   ```

## Outputs

The current Terraform configuration outputs:

- `public_ip` — the public IP address of the EC2 instance
- `vpc_id` — the ID of the created VPC

## Cleanup

To remove all resources created by Terraform:

```bash
terraform destroy
```

## Learning Goals

This repository is designed to help demonstrate:

- Infrastructure as Code with Terraform
- Basic AWS networking setup
- EC2 deployment and bootstrap scripts
- Security group configuration
- Documentation and output practices for cloud infrastructure
- Gradual progression toward a more production-ready architecture

## Notes

- The `key_name` variable must match an existing EC2 key pair in your AWS account.
- The user data script installs NGINX automatically during instance startup.
- The next phases will build on this baseline and add more security, scalability, and observability.
