variable "DBPass" {
  description = "values for the DB password"
  type        = string
  sensitive   = true
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

variable "SG_DB" {
  description = "value for the DB security group"
}
variable "redis_SG" {
  description = "value for the Redis security group"
}
