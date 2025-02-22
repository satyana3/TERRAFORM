variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type = string
}

variable "availability_zones" {
    description = "List of availability zones for the VPC"
    type = list(string)
  
}

variable "private_subnet_cidrs" {
    description = "CIDR blocks for the private subnets"
    type = list(string)
  
}

variable "public_subnet_cidrs" {
    description = "CIDR blocks for the public subnets"
    type = list(string)
}

variable "cluster_name" {
    description = "name of the EKS cluster"
    type = string
}

variable "nat_gateway_count" {
  description = "Number of NAT gateways to create"
  type        = number
  default     = 1
}

