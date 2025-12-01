provider "huaweicloud" {
  region = local.region
}

locals {
  name   = "kps-keypair-ex-${basename(path.cwd)}"
  region = "tr-west-1"
}

module "dew" {
  source = "../.."

  create_keypair          = true
  keypair_name            = "${local.name}-cce-key"
  keypair_scope           = "user"
  keypair_encryption_type = "default"
  keypair_key_file        = "example-cce-key.pem"
}
