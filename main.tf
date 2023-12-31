# Create the VPC
module "vpc" {
  source = "./modules/vpc"

  # Set the VPC name
  vpc_name = local.vpc_name

  # Set the cluster name
  cluster_name = local.cluster_name
}

# Create the EKS cluster
module "eks" {
  source = "./modules/eks"

  cluster_name = local.cluster_name

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets

  enable_ebs_csi_driver = true
}

# Create the ECR repository
module "ecr" {
  source = "./modules/ecr"

  # Set the project name
  project_name = var.project_name
}
