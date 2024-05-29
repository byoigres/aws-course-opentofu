output "private_key_openssh" {
  value     = tls_private_key.developer.private_key_openssh
  sensitive = true
}
