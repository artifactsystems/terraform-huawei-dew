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

################################################################################
# CSMS Secret
################################################################################

output "csms_secret_id" {
  description = "The resource ID of the CSMS secret (constructed from secret ID and name, separated by a slash)"
  value       = try(huaweicloud_csms_secret.this[0].id, null)
}

output "csms_secret_secret_id" {
  description = "The secret ID in UUID format"
  value       = try(huaweicloud_csms_secret.this[0].secret_id, null)
}

output "csms_secret_name" {
  description = "The name of the CSMS secret"
  value       = try(huaweicloud_csms_secret.this[0].name, null)
}

output "csms_secret_latest_version" {
  description = "The latest version ID of the CSMS secret"
  value       = try(huaweicloud_csms_secret.this[0].latest_version, null)
}

output "csms_secret_version_stages" {
  description = "The secret version status list"
  value       = try(huaweicloud_csms_secret.this[0].version_stages, null)
}

output "csms_secret_status" {
  description = "The CSMS secret status. Values can be: ENABLED, DISABLED, PENDING_DELETE and FROZEN"
  value       = try(huaweicloud_csms_secret.this[0].status, null)
}

output "csms_secret_create_time" {
  description = "Time when the CSMS secret was created, in UTC format"
  value       = try(huaweicloud_csms_secret.this[0].create_time, null)
}
