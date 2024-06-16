resource "aws_lightsail_key_pair" "key_pair" {
  name       = "${local.name}_key_pair"
  public_key = tls_private_key.lightsail_developer_key_pair.public_key_openssh
  tags       = local.tags
  depends_on = [tls_private_key.lightsail_developer_key_pair]
}

resource "tls_private_key" "lightsail_developer_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
