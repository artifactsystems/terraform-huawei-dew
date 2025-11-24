provider "huaweicloud" {
  region = local.region
}

locals {
  region = "tr-west-1"
  name   = "kms-ex-${basename(path.cwd)}"

  tags = {
    Example    = local.name
    GithubRepo = "terraform-huawei-dew"
    GithubOrg  = "terraform-huawei-modules"
  }
}

module "dew" {
  source = "../.."

  key_alias   = "proj/app-primary"
  description = "Complete example key"
  key_spec    = "AES_256"
  key_usage   = "ENCRYPT_DECRYPT"
  is_enabled  = true

  enable_key_rotation     = true
  rotation_period_in_days = 90
  deletion_window_in_days = 7

  aliases = [
    "proj/app-secondary",
    "alias/proj/app-ops",
  ]

  tags = local.tags
}