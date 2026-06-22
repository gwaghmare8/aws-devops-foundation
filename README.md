# Phase 1 Architecture

This folder provisions a simple AWS networking and compute setup for the first phase of the project.

## What this architecture creates

The Terraform configuration deploys:

- 1 VPC
- 1 public subnet
- 1 Internet Gateway
- 1 public route table with a default route to the Internet Gateway
- 1 security group allowing inbound traffic on ports 22 and 80
- 1 EC2 instance running Amazon Linux 2023
- A user data script that installs and starts NGINX

## Network layout

- VPC CIDR: `10.0.0.0/16`
- Public subnet CIDR: `10.0.1.0/24`
- Region: `eu-west-3` (default)

## EC2 details

- Instance type: `t3.micro` (default)
- SSH key pair: configured via the `key_name` variable
- The instance is launched in the public subnet and uses the security group to allow HTTP and SSH access

## Required inputs

Before running Terraform, you must provide or confirm the following values:

- `aws_region` (default: `eu-west-3`)
- `vpc_cidr` (default: `10.0.0.0/16`)
- `public_subnet_cidr` (default: `10.0.1.0/24`)
- `instance_type` (default: `t3.micro`)
- `key_name` (required) — the name of an existing EC2 key pair in your AWS account

> The `key_name` value is not created automatically by this configuration. You must create the key pair in AWS first and use its name here.

## Outputs

After `terraform apply`, Terraform will output:

- `public_ip` — the EC2 instance public IP address
- `vpc_id` — the VPC ID

## Deployment steps

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Review the plan:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

4. View outputs:
   ```bash
   terraform output
   ```

## Accessing the instance

Once the instance is running:

- You can access the web server via the public IP on port 80
- You can SSH into the instance using the private key associated with the configured key pair

Example:

```bash
ssh -i /path/to/your-key.pem ec2-user@<public_ip>
```

## Cleanup

To remove all created resources:

```bash
terraform destroy
```

## Notes

- The user data script installs NGINX automatically when the EC2 instance starts.
- This phase focuses on a basic public networking setup and a single web server.
