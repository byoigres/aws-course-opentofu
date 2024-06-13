resource "aws_key_pair" "developer" {
  key_name   = "developer"
  public_key = tls_private_key.developer.public_key_openssh
  tags = local.tags
  depends_on = [ tls_private_key.developer ]
}

resource "tls_private_key" "developer" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
