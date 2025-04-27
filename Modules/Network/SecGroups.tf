resource "aws_security_group" "Allow_SSH" {
  vpc_id = aws_vpc.MyVPC.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.Pub_Rtb_Cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.Pub_Rtb_Cidr]
  }
  tags = {
    Name = "Allow_SSH"
  }
}
resource "aws_security_group" "App_SG" {
  vpc_id = aws_vpc.MyVPC.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.MyVPC.cidr_block]
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.MyVPC.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.Priv_Rtb_Cidr]
  }
  tags = {
    Name = "App_SG"
  }
}

resource "aws_security_group" "db" {

  vpc_id = aws_vpc.MyVPC.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.MyVPC.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.Priv_Rtb_Cidr]
  }

  tags = {
    Name = "Database_SecGrp"
  }
}

resource "aws_security_group" "redis" {

  vpc_id = aws_vpc.MyVPC.id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.MyVPC.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.Priv_Rtb_Cidr]
  }

  tags = {
    Name = "Redis_SecGrp"
  }

}
