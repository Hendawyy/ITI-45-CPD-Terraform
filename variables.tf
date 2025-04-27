variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "pub_subnet_cidr" {
  description = "The CIDR block for the Public subnet"
  type        = string
}
variable "Pub_subnet_Count" {
  description = "The number of Public subnets to create"
  type        = number
}
variable "Priv_subnet_Count" {
  description = "The number of Private subnets to create"
  type        = number
}
variable "subnets" {
  description = "values for the subnets"
  type = map(object({
    subnet_cidr       = string
    availability_zone = string
    type              = string
  }))
}
variable "priv_subnet_cidr" {
  description = "The CIDR block for the Private subnet"
  type        = string
}
variable "Pub_Rtb_Cidr" {
  description = "The CIDR block for the Public Route Table"
  type        = string
}
variable "Priv_Rtb_Cidr" {
  description = "The CIDR block for the Private Route Table"
  type        = string
}
variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
}
variable "ssh_key_name" {
  description = "The name of the SSH key pair to use for EC2 instances"
  type        = string
}
variable "ssh_algorithm" {
  description = "The SSH algorithm to use for the key pair"
  type        = string
}
variable "ssh_key_bits" {
  description = "The number of bits for the SSH key pair"
  type        = number
}
variable "local_file_name" {
  description = "The path to the local file to store the SSH key pair"
  type        = string
}
variable "file_permission" {
  description = "The file permission for the SSH key pair"
  type        = string
}
variable "instances" {
  description = "Values for the instances"
  type = map(object({
    subnet_type    = string
    security_group = string
  }))
}
variable "DBPass" {
  description = "values for the DB password"
  type        = string
  sensitive   = true
}

variable "email" {
  description = "The email address to verify with SES"
  type        = string
}
