################################################################################
# Key
################################################################################

output "key_id" {
  description = "The unique identifier of the key"
  value       = try(huaweicloud_kms_key.this[0].id, null)
}

################################################################################
# KPS Keypair
################################################################################

output "keypair_name" {
  description = "The name of the KPS keypair"
  value       = try(huaweicloud_kps_keypair.this[0].name, null)
}

output "keypair_id" {
  description = "The ID of the KPS keypair (equals to name)"
  value       = try(huaweicloud_kps_keypair.this[0].id, null)
}

output "keypair_fingerprint" {
  description = "The fingerprint of the KPS keypair"
  value       = try(huaweicloud_kps_keypair.this[0].fingerprint, null)
}

################################################################################
# Aliases
################################################################################

output "aliases" {
  description = "A map of aliases created and their attributes"
  value       = huaweicloud_kms_alias.this
}
