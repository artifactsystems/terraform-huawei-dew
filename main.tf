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
}

resource "huaweicloud_kms_alias" "this" {
  for_each = var.create ? local.alias_map : {}

  region = var.region
  alias  = each.value.name
  key_id = huaweicloud_kms_key.this[0].id
}
