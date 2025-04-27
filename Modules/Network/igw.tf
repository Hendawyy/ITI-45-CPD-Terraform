resource "aws_internet_gateway" "MyIGW" {
  vpc_id = aws_vpc.MyVPC.id
  tags = {
    Name = "MyIGW"
  }
}
