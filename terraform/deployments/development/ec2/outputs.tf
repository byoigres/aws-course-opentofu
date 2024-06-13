output "private_key_openssh" {
  value       = tls_private_key.developer.private_key_openssh
  sensitive   = true
  description = "The OpenSSH private key for the developer"
}

output "ec2_public_ip" {
  value       = aws_instance.my_instance.public_ip
  description = "The public IP address of the EC2 instance"
}

output "ec2_instance_id" {
  value       = aws_instance.my_instance.id
  description = "The ID of the EC2 instance"
}
