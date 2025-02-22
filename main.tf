terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "3.0.0"
        }
    }

    backend "s3" {
        bucket         = "demodevopsbucket16"
        key            = "terraform/eks/terraform.tfstate"  
        region         = "us-west-2"
        dynamodb_table = "demodevopsbucket-state-lock"
        encrypt        = true
    }
}

provider "aws" {
    region = var.region  # Correctly reference the variable without quotes
}

module "VPC" {
    source = "D:\\modules\\VPC"

    vpc_cidr            = var.vpc_cidr  # Correctly reference the variable without quotes
    availability_zones  = var.availability_zones  # Correctly reference the variable without quotes
    public_subnet_cidrs = var.public_subnet_cidrs  # Correctly reference the variable without quotes
    private_subnet_cidrs = var.private_subnet_cidrs  # Correctly reference the variable without quotes
    cluster_name        = var.cluster_name  # Correctly reference the variable without quotes
}

module "EKS" {
    source = "D:\\modules\\EKS"

    cluster_name    = var.cluster_name  # Correctly reference the variable without quotes
    cluster_version = var.cluster_version  # Correctly reference the variable without quotes
    vpc_id          = module.VPC.vpc_id  # Correctly reference the module output without quotes
    subnet_ids      = module.VPC.subnet_ids  # Correctly reference the module output without quotes
    node_groups     = var.node_groups  # Correctly reference the variable without quotes
}