resource "aws_lightsail_instance" "instance" {
  name              = "${var.blueprint_id}-${var.bundle_id}-${local.name}"
  availability_zone = var.availability_zone
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
  ip_address_type   = "ipv4"
  key_pair_name     = aws_lightsail_key_pair.key_pair.name
  user_data         = file("lightsail-user-data.sh")
  tags              = local.tags
  depends_on        = [aws_lightsail_key_pair.key_pair]
}
