# resource "aws_eip" "eip_nat" {
#   domain = "vpc"
#   tags = {
#     Name = "EIP-NAT"
#   }
# }

# resource "aws_nat_gateway" "NatGW" {
#   allocation_id = aws_eip.eip_nat.id
#   subnet_id     = aws_subnet.PubSubnet.id
#   tags = {
#     Name = "NatGW"
#   }
# }
