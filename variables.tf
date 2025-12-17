variable "create" {
  description = "Determines whether resources will be created (affects all resources)"
  type        = bool
  default     = false
}

variable "region" {
  description = "Region where the resource(s) will be managed. Defaults to the provider region"
  type        = string
  default     = null
}

variable "enterprise_project_id" {
  description = "Enterprise Project ID (optional)"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

################################################################################
# KPS Keypair
################################################################################

variable "create_keypair" {
  description = "Determines whether a KPS keypair will be created/managed"
  type        = bool
  default     = false
}

variable "keypair_name" {
  description = "Name of the KPS keypair to create or manage"
  type        = string
  default     = null
}

variable "keypair_scope" {
  description = "Scope of the keypair: user or account"
  type        = string
  default     = "user"
}

variable "keypair_encryption_type" {
  description = "Encryption mode for the keypair: default or kms"
  type        = string
  default     = null
}

variable "keypair_kms_key_id" {
  description = "KMS key ID used to encrypt the keypair private key (when encryption_type is kms)"
  type        = string
  default     = null
}

variable "keypair_kms_key_name" {
  description = "KMS key name used to encrypt the keypair private key (when encryption_type is kms)"
  type        = string
  default     = null
}

variable "keypair_description" {
  description = "Description for the KPS keypair"
  type        = string
  default     = null
}

variable "keypair_public_key" {
  description = "Existing OpenSSH-formatted public key to import as a KPS keypair"
  type        = string
  default     = null
}

variable "keypair_private_key" {
  description = "Existing OpenSSH-formatted private key to import as a KPS keypair"
  type        = string
  default     = null
}

variable "keypair_key_file" {
  description = "Path to the private key file to be created for the KPS keypair"
  type        = string
  default     = null
}

################################################################################
# Key (core)
################################################################################

variable "description" {
  description = "Key description (mapped to key_description)"
  type        = string
  default     = null
}

variable "key_alias" {
  description = "Primary alias to use when creating the key (required)"
  type        = string
  default     = null
}

variable "key_usage" {
  description = "Intended use of the key: ENCRYPT_DECRYPT or SIGN_VERIFY"
  type        = string
  default     = null
}

variable "key_spec" {
  description = "Key algorithm/spec (AES_256, SM4, RSA_2048/3072/4096, EC_P256/EC_P384, SM2)"
  type        = string
  default     = null
}

variable "is_enabled" {
  description = "Specifies whether the key is enabled"
  type        = bool
  default     = true
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled"
  type        = bool
  default     = false
}

variable "rotation_period_in_days" {
  description = "Custom period of time between each rotation date (30-365)"
  type        = number
  default     = null
}

variable "deletion_window_in_days" {
  description = "Waiting period before scheduled deletion (7-1096 days)"
  type        = number
  default     = null
}

################################################################################
# Aliases
################################################################################

variable "aliases" {
  description = "A list of aliases to create (static strings)"
  type        = list(string)
  default     = []
}

################################################################################
# CSMS Secret
################################################################################

variable "create_csms_secret" {
  description = "Determines whether a CSMS secret will be created/managed"
  type        = bool
  default     = false
}

variable "csms_secret_name" {
  description = "Name of the CSMS secret to create or manage"
  type        = string
  default     = null
}

variable "csms_secret_text" {
  description = "Plaintext of a text secret. CSMS encrypts the plaintext and stores it in the initial version. Maximum size is 32 KB. Either secret_text or secret_binary must be specified, but not both"
  type        = string
  default     = null
  sensitive   = true
}

variable "csms_secret_binary" {
  description = "Plaintext of a binary secret encoded using Base64. CSMS encrypts the plaintext and stores it in the initial version. Maximum size is 32 KB. Either secret_text or secret_binary must be specified, but not both"
  type        = string
  default     = null
  sensitive   = true
}

variable "csms_secret_description" {
  description = "Description of the CSMS secret"
  type        = string
  default     = null
}

variable "csms_secret_type" {
  description = "Type of the secret. Currently, only COMMON is supported"
  type        = string
  default     = "COMMON"
}

variable "csms_kms_key_id" {
  description = "ID of the KMS key used to encrypt secrets. If not specified, the default master key csms/default will be used. Can reference a KMS key created in this module"
  type        = string
  default     = null
}

variable "csms_expire_time" {
  description = "Expiration time of a secret in milliseconds (timestamp format). Can only be edited when status is ENABLED. Must be greater than current time. Ensure last three digits are 0 (e.g., 1729243021000)"
  type        = number
  default     = null
}

variable "csms_tags" {
  description = "A map of tags to add to the CSMS secret"
  type        = map(string)
  default     = {}
}
