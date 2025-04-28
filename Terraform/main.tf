module "vpc" {
  source = "./VPC"

  # Pass variables if you want to override defaults
  vpc_name             = "custom-vpc"
  cidr_block           = "10.1.0.0/16"
  public_subnets       = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  public_subnet_names  = ["custom-public-1", "custom-public-2", "custom-public-3"]
  private_subnets      = ["10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]
  private_subnet_names = ["custom-private-1", "custom-private-2", "custom-private-3"]
  region               = "us-east-1"
}

# Security Group
module "sg" {
  source  = "./sg"
  sg_name = "my-ec2-sg"
  vpc_id  = module.vpc.vpc_id   # Assuming your VPC module outputs vpc_id
}

# # Key Pair
# module "keypair" {
#   source     = "./keypair"  # Use "keypair" folder
#   key_name   = "my-ec2-key"
#   public_key = file("~/.ssh/id_rsa.pub")  # Path to your public SSH key
# }

# Instances

module "ec2_instances" {
  source             = "./ec2_instances"
  public_subnet_id   = module.vpc.public_subnet_ids[0]  # Public subnet ID from VPC
  private_subnet_id  = module.vpc.private_subnet_ids[0]  # Private subnet ID from VPC
  key_name           = "example"    # Key pair name from keypair 
  sg_id              = module.sg.sg_id  # Pass sg_id instead of sg_name
  instance_profile_name = module.iam.instance_profile_name # calling iam role module

  instance_type = terraform.workspace == "dev" ? "t2.micro" : "t3.micro"
}

#LoadBalancer

module "loadbalancer" {
  source      = "./loadbalancer"  # Reference the loadbalancer folder
  subnet_ids  = module.vpc.public_subnet_ids  # Example: Use subnet IDs from the VPC module
  sg_id       = module.sg.sg_id  # Pass security group ID from the SG module
  vpc_id      = module.vpc.vpc_id  # Example: Use VPC ID from the VPC module
}

output "load_balancer_dns" {
  value = module.loadbalancer.load_balancer_dns
}

module "ecr" {
  source              = "./ecr"
  frontend_repo_name  = "frontend"
  backend_repo_name   = "backend"
  packages_repo_name  = "packages"
}

#ECR

# Optional: Output the repo URLs at the root level
output "frontend_repo_url" {
  value = module.ecr.frontend_repo_url
}

output "backend_repo_url" {
  value = module.ecr.backend_repo_url
}

output "packages_repo_url" {
  value = module.ecr.packages_repo_url
}

#Iam Role 

module "iam" {
  source          = "./iam"
  iam_role_name   = "ec2-s3-access-role"
  iam_policy_name = "ec2-s3-access-policy"
  bucket_name     = module.s3.bucket_name
}

# s3 Storage

module "s3" {
  source      = "./s3"
  bucket_name = "akash-demo-bucket-12345"  # << Your S3 bucket name
}




