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
