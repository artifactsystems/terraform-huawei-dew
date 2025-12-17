output "secret_text_id" {
  description = "ID of the CSMS secret with plaintext"
  value       = module.dew_secret_text.csms_secret_id
}

output "secret_text_name" {
  description = "Name of the CSMS secret with plaintext"
  value       = module.dew_secret_text.csms_secret_name
}

output "secret_json_id" {
  description = "ID of the CSMS secret with JSON data"
  value       = module.dew_secret_json.csms_secret_id
}

output "secret_with_kms_id" {
  description = "ID of the CSMS secret encrypted with custom KMS key"
  value       = module.dew_secret_with_kms.csms_secret_id
}

output "kms_key_id" {
  description = "ID of the KMS key used for secret encryption"
  value       = module.dew_secret_with_kms.key_id
}
