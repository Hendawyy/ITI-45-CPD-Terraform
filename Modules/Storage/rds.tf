resource "aws_db_subnet_group" "dbsubnet" {
  name = "my-db-subnet-group"
  subnet_ids = [
    for subnet in var.Subnets : subnet.id
    if subnet.tags["Type"] == "private"
  ]

  tags = {
    Name = "dbsubnet"
  }
}


resource "aws_db_instance" "mysql" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = var.DBPass
  parameter_group_name   = "default.mysql8.0"
  publicly_accessible    = false
  vpc_security_group_ids = [var.SG_DB]
  db_subnet_group_name   = aws_db_subnet_group.dbsubnet.name
  skip_final_snapshot    = true

  tags = {
    Name = "MySQL DB Instance"
  }
}
