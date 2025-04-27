module "Network" {
  source            = "./Modules/Network"
  vpc_cidr          = var.vpc_cidr
  pub_subnet_cidr   = var.pub_subnet_cidr
  priv_subnet_cidr  = var.priv_subnet_cidr
  Pub_subnet_Count  = var.Pub_subnet_Count
  Priv_subnet_Count = var.Priv_subnet_Count
  Pub_Rtb_Cidr      = var.Pub_Rtb_Cidr
  Priv_Rtb_Cidr     = var.Priv_Rtb_Cidr
  subnets           = var.subnets
}
module "Compute" {
  source          = "./Modules/Compute"
  instance_type   = var.instance_type
  Subnets         = module.Network.Subnets_list
  ami_id          = data.aws_ami.ubuntu.id
  Allow_SSH       = module.Network.SecUrity_Group_ID_Allow_SSH
  APP_SG          = module.Network.SecUrity_Group_ID_APP_SG
  ssh_key_name    = var.ssh_key_name
  ssh_key_bits    = var.ssh_key_bits
  ssh_algorithm   = var.ssh_algorithm
  local_file_name = var.local_file_name
  file_permission = var.file_permission
  instances       = var.instances
}
module "Storage" {
  source   = "./Modules/Storage"
  DBPass   = var.DBPass
  Subnets  = module.Network.Subnets_list
  SG_DB    = module.Network.SecUrity_Group_ID_DB
  redis_SG = module.Network.SecUrity_Group_ID_Redis
}

module "Email" {
  source = "./Modules/Email"
  email  = var.email
}
