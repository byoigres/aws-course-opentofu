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

resource "aws_lightsail_instance_public_ports" "instance_ports" {
  instance_name = aws_lightsail_instance.instance.name

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
  }

  port_info {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
  }

  port_info {
    protocol  = "tcp"
    from_port = 443
    to_port   = 443
  }

  port_info {
    protocol  = "tcp"
    from_port = 8000
    to_port   = 8000
  }

  port_info {
    protocol  = "tcp"
    from_port = 6001
    to_port   = 6001
  }
}

