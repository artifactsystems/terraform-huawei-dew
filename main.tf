################################################################################
# Key (core)
################################################################################

resource "huaweicloud_kms_key" "this" {
  count = var.create ? 1 : 0

  region          = var.region
  key_alias       = var.key_alias
  key_description = var.description
  key_algorithm   = var.key_spec
  key_usage       = var.key_usage

  enterprise_project_id = var.enterprise_project_id
  tags                  = var.tags

  is_enabled        = var.is_enabled
  rotation_enabled  = var.enable_key_rotation
  rotation_interval = var.rotation_period_in_days
  pending_days      = var.deletion_window_in_days == null ? null : tostring(var.deletion_window_in_days)
}

################################################################################
# Aliases
################################################################################

locals {
  alias_map = {
    for name in var.aliases : name => {
      name = startswith(name, "alias/") ? name : "alias/${name}"
    }
  }

  csms_kms_key_id = var.csms_kms_key_id != null ? var.csms_kms_key_id : (
    var.create ? try(huaweicloud_kms_key.this[0].id, null) : null
  )
}

################################################################################
# KPS Keypair
################################################################################

resource "huaweicloud_kps_keypair" "this" {
  count = var.create_keypair && var.keypair_name != null ? 1 : 0

  region = var.region

  name        = var.keypair_name
  scope       = var.keypair_scope
  description = var.keypair_description

  encryption_type = var.keypair_encryption_type
  kms_key_id      = var.keypair_kms_key_id
  kms_key_name    = var.keypair_kms_key_name

  public_key  = var.keypair_public_key
  private_key = var.keypair_private_key
  key_file    = var.keypair_key_file
}

resource "huaweicloud_kms_alias" "this" {
  for_each = var.create ? local.alias_map : {}

  region = var.region
  alias  = each.value.name
  key_id = huaweicloud_kms_key.this[0].id
}

################################################################################
# CSMS Secret
################################################################################

resource "huaweicloud_csms_secret" "this" {
  count = var.create_csms_secret && var.csms_secret_name != null ? 1 : 0

  region = var.region

  name                  = var.csms_secret_name
  secret_text           = var.csms_secret_text
  secret_binary         = var.csms_secret_binary
  description           = var.csms_secret_description
  secret_type           = var.csms_secret_type
  kms_key_id            = local.csms_kms_key_id
  expire_time           = var.csms_expire_time
  enterprise_project_id = var.enterprise_project_id
  tags                  = var.csms_tags
}
