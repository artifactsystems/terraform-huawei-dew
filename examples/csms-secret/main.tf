provider "huaweicloud" {
  region = local.region
}

locals {
  name   = "csms-ex-${basename(path.cwd)}"
  region = "tr-west-1"

  tags = {
    Example    = local.name
    GithubRepo = "terraform-huawei-dew"
    GithubOrg  = "artifactsystems"
  }
}

################################################################################
# Example 1: CSMS Secret with plaintext
################################################################################

module "dew_secret_text" {
  source = "../.."

  create_csms_secret = true

  csms_secret_name        = "${local.name}-text"
  csms_secret_text        = "my-secret-password-123"
  csms_secret_description = "Example CSMS secret with plaintext"
  csms_secret_type        = "COMMON"

  csms_tags = local.tags
}

################################################################################
# Example 2: CSMS Secret with JSON data
################################################################################

module "dew_secret_json" {
  source = "../.."

  create_csms_secret = true

  csms_secret_name = "${local.name}-json"
  csms_secret_text = jsonencode({
    username = "admin"
    password = "secure-password-456"
    database = "production"
  })
  csms_secret_description = "Example CSMS secret with JSON data"
  csms_secret_type        = "COMMON"

  csms_tags = local.tags
}

################################################################################
# Example 3: CSMS Secret with KMS key integration (OPTIONAL)
################################################################################
# Note: CSMS secrets can use a custom KMS key for encryption, but this is OPTIONAL.
# By default, CSMS uses its own default master key (csms/default).
# This example shows how to use a custom KMS key if you need additional control.

module "dew_secret_with_kms" {
  source = "../.."

  # Create KMS key (optional - only if you want custom encryption)
  create = true

  key_alias   = "${local.name}-kms-key"
  description = "KMS key for CSMS secret encryption"
  key_spec    = "AES_256"
  key_usage   = "ENCRYPT_DECRYPT"
  is_enabled  = true

  tags = local.tags

  # Create CSMS secret (will use the KMS key created above)
  create_csms_secret = true

  csms_secret_name        = "${local.name}-kms-encrypted"
  csms_secret_text        = "highly-sensitive-data"
  csms_secret_description = "Example CSMS secret encrypted with custom KMS key"
  csms_secret_type        = "COMMON"
  # csms_kms_key_id is optional - when a KMS key is created in the same module (create = true),
  # it will automatically use that key. You can also explicitly set it:
  # csms_kms_key_id = module.dew_secret_with_kms.key_id  # Explicit reference (not needed, shown for clarity)
  # If not specified and no KMS key is created, CSMS will use its default key (csms/default)

  csms_tags = local.tags
}
