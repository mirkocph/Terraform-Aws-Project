variable "region" {
  default = "eu-west-1"
}

variable "project_name" {
  default = "terraform-aws-project"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "db_password" {
  description = "Password del database RDS"
  sensitive   = true
}