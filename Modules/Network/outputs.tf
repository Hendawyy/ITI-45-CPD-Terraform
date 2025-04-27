output "VPC_ID" {
  value = aws_vpc.MyVPC.id
}
output "Subnets_list" {
  value = {
    for subnet, details in aws_subnet.Subnets :
    subnet => {
      id                = details.id
      subnet_cidr       = details.cidr_block
      availability_zone = details.availability_zone
      type              = details.tags["Type"]
      tags              = details.tags 
    }
  }
}

output "SecUrity_Group_ID_Allow_SSH" {
  value = aws_security_group.Allow_SSH.id
}
output "SecUrity_Group_ID_APP_SG" {
  value = aws_security_group.App_SG.id
}
output "SecUrity_Group_ID_DB" {
  value = aws_security_group.db.id
}
output "SecUrity_Group_ID_Redis" {
  value = aws_security_group.redis.id
}
