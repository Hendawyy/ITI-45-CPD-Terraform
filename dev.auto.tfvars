aws_region = "us-east-1"
vpc_cidr   = "10.0.0.0/16"

subnets = {
  public_subnet_0 = {
    subnet_cidr       = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    type              = "public"
  }
  public_subnet_1 = {
    subnet_cidr       = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    type              = "public"
  }
  private_subnet_0 = {
    subnet_cidr       = "10.0.3.0/24"
    availability_zone = "us-east-1a"
    type              = "private"
  }
  private_subnet_1 = {
    subnet_cidr       = "10.0.4.0/24"
    availability_zone = "us-east-1b"
    type              = "private"
  }
}

Pub_subnet_Count  = 2
Priv_subnet_Count = 2

pub_subnet_cidr  = "10.0.1.0/24"
priv_subnet_cidr = "10.0.3.0/24"
Pub_Rtb_Cidr     = "0.0.0.0/0"
Priv_Rtb_Cidr    = "0.0.0.0/0"

instance_type = "t2.micro"
instances = {
  "Bastion" = {
    subnet_type    = "public"
    security_group = "Allow_SSH"
  }
  "Application" = {
    subnet_type    = "private"
    security_group = "App_SG"
  }
}

ssh_key_name    = "dev-keypair"
ssh_algorithm   = "RSA"
ssh_key_bits    = 2048
local_file_name = "dev-keypair.pem"
file_permission = "0400"

DBPass = "MySecretPassword"
email = "seifhendawy1@gmail.com"