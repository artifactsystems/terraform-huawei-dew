output "example_keypair_name" {
  description = "Name of the example KPS keypair for CCE nodes"
  value       = module.dew.keypair_name
}

output "example_keypair_fingerprint" {
  description = "Fingerprint of the example KPS keypair"
  value       = module.dew.keypair_fingerprint
}
