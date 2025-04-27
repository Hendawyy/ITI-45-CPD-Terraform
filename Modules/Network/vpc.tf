resource "aws_vpc" "MyVPC" {
  cidr_block         = var.vpc_cidr
  enable_dns_support = true
  tags = {
    Name = "MyVPC"
  }
}