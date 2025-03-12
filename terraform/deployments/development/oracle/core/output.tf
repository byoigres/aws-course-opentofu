# Output the "list" of all availability domains.
output "availability_domains" {
  value = data.oci_identity_availability_domains.availability_domains
}
