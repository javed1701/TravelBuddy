variable "aws_region" {
    description = "AWS Region"
    type = string
}

variable "project_name" {
    description = "Project Name"
    type = string
}

variable "vpc_cidr" {
    description = "VPC CIDR BLock"
    type = string
}

variable "public_subnets" {
    description = "Public Subnets"
    type = list(string)
}

variable "private_subnets" {
    description = "Private Subnets"
    type = list(string)
}

