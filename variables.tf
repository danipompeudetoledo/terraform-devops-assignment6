# variables.tf

variable "region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  default     = "devops-key"
}

variable "project_name" {
  description = "Project name prefix for resources"
  default     = "devops-assignment6"
}

variable "ami_id" {
  description = "AMI ID for Amazon Linux 2"
  default     = "ami-0c02fb55956c7d316"
}

