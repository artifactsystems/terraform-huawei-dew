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
