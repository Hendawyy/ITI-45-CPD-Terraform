resource "aws_subnet" "Subnets" {
  for_each = var.subnets

  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = each.value.subnet_cidr
  map_public_ip_on_launch = each.value.type == "public" ? true : false
  availability_zone       = each.value.availability_zone

  tags = {
    Name = each.key
    Type = each.value.type
  }
}
