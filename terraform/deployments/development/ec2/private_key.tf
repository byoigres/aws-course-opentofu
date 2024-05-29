resource "aws_key_pair" "developer" {
  key_name   = "developer"
  public_key = tls_private_key.developer.public_key_openssh
}

resource "tls_private_key" "developer" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
