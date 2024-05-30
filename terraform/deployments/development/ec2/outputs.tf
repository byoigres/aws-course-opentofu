output "private_key_openssh" {
  value     = tls_private_key.developer.private_key_openssh
  sensitive = true
}

output "ec2_public_ip" {
  value = aws_instance.my_instance.public_ip
}

output "ec2_instance_id" {
  value = aws_instance.my_instance.id
}
