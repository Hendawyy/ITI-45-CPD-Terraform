resource "aws_route_table" "PubRtb" {
  vpc_id = aws_vpc.MyVPC.id
  route {
    cidr_block = var.Pub_Rtb_Cidr
    gateway_id = aws_internet_gateway.MyIGW.id
  }
  tags = {
    Name = "PubRtb"
  }
}
resource "aws_route_table" "PrvRtb" {
  vpc_id = aws_vpc.MyVPC.id
  route {
    cidr_block = var.Priv_Rtb_Cidr
    gateway_id = aws_internet_gateway.MyIGW.id
    # gateway_id = aws_nat_gateway.NatGW.id
  }
  tags = {
    Name = "PrvRtb"
  }
}

resource "aws_route_table_association" "PubAssoc" {
  for_each = {
    for subnet_id, subnet in aws_subnet.Subnets : subnet_id => subnet
    if subnet.tags["Type"] == "public"
  }

  subnet_id      = each.value.id
  route_table_id = aws_route_table.PubRtb.id
}

resource "aws_route_table_association" "PrvAssoc" {
  for_each = {
    for subnet_id, subnet in aws_subnet.Subnets : subnet_id => subnet
    if subnet.tags["Type"] == "private"
  }

  subnet_id      = each.value.id
  route_table_id = aws_route_table.PrvRtb.id
}
