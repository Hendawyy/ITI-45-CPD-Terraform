resource "aws_instance" "Ec2s" {
  for_each = var.instances  

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.ssh_key_name
  vpc_security_group_ids = [
    each.key == "Bastion" ? var.Allow_SSH : var.APP_SG
  ]

  subnet_id = each.key == "Bastion" ? element([for subnet in var.Subnets : subnet.id if subnet.tags["Type"] == "public"], 0) : element([for subnet in var.Subnets : subnet.id if subnet.tags["Type"] == "private"], 0)

  provisioner "local-exec" {
    command = "echo INSTANCE_NAME: $env:INSTANCE_NAME && echo Public IP: ${self.public_ip}"
    environment = {
      INSTANCE_NAME = each.key
    }
  }

  tags = {
    Name = each.key
  }
}
