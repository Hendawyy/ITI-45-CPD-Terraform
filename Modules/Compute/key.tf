resource "tls_private_key" "rsa-key" {
  algorithm = var.ssh_algorithm
  rsa_bits  = var.ssh_key_bits
}

resource "aws_key_pair" "sshkeypair" {
  key_name   = var.ssh_key_name
  public_key = tls_private_key.rsa-key.public_key_openssh
}

resource "local_file" "ssh-key" {
  content         = tls_private_key.rsa-key.private_key_pem
  filename        = var.local_file_name
  file_permission = var.file_permission
}
