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
variable "ami_id" {
  description = "The AMI ID to use for the EC2 instances"
  type        = string

}
variable "Allow_SSH" {
  description = "Allow SSH access to the instances"
}
variable "APP_SG" {
  description = "The security group for the application"
}

variable "Subnets" {
  description = "Values for the subnets"
  type = map(object({
    id                = string
    subnet_cidr       = string
    availability_zone = string
    type              = string
    tags              = map(string)
  }))
}


