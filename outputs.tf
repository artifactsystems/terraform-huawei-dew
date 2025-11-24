################################################################################
# Key
################################################################################

output "key_id" {
  description = "The unique identifier of the key"
  value       = try(huaweicloud_kms_key.this[0].id, null)
}

################################################################################
# Aliases
################################################################################

output "aliases" {
  description = "A map of aliases created and their attributes"
  value       = huaweicloud_kms_alias.this
}


