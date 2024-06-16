output "lightsail_key_pair_private_key" {
  value = aws_lightsail_key_pair.key_pair.private_key
}

output "lightsail_public_ip_adreess" {
  value = aws_lightsail_instance.instance.public_ip_address
}

output "lightsail_username" {
  value = aws_lightsail_instance.instance.username
}
