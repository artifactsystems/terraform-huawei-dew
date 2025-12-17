# CSMS Secret Examples

This example demonstrates various ways to use the CSMS (Cloud Secret Management Service) features of the terraform-huawei-dew module.

This example creates multiple CSMS secrets with different configurations:
- Basic plaintext secret
- JSON-encoded secret data
- Secret encrypted with custom KMS key

## Usage

To run this example, execute:

```bash
terraform init
terraform plan
terraform apply
```

**Note:** This example may create billable resources (CSMS secrets, KMS keys). Run `terraform destroy` when you no longer need these resources.

## Configuration

This example creates:

- **Example 1**: Basic CSMS secret with plaintext data (uses default CSMS master key)
- **Example 2**: CSMS secret with JSON-encoded data (uses default CSMS master key)
- **Example 3**: CSMS secret encrypted with custom KMS key (creates KMS key and uses it for encryption)

## Prerequisites

- **KMS Service**: KMS (Key Management Service) must be enabled in your HuaweiCloud account. CSMS uses KMS for encryption, so KMS must be active before creating CSMS secrets.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| huaweicloud | >= 1.79.0 |

## Providers

| Name | Version |
|------|---------|
| huaweicloud | >= 1.79.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| dew_secret_text | ../.. | n/a |
| dew_secret_json | ../.. | n/a |
| dew_secret_with_kms | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| huaweicloud_csms_secret.this | resource |
| huaweicloud_kms_key.this | resource |

## Inputs

This example does not require any inputs. All configuration is handled through locals in main.tf.

## Outputs

| Name | Description |
|------|-------------|
| secret_text_id | ID of the CSMS secret with plaintext |
| secret_text_name | Name of the CSMS secret with plaintext |
| secret_json_id | ID of the CSMS secret with JSON data |
| secret_with_kms_id | ID of the CSMS secret encrypted with custom KMS key |
| kms_key_id | ID of the KMS key used for secret encryption |

## Notes

- **KMS Service Required**: CSMS secrets require KMS service to be enabled. If you get encryption errors, ensure KMS is activated in your HuaweiCloud account.
- CSMS secrets can store up to 32 KB of data
- Either `csms_secret_text` or `csms_secret_binary` must be specified, but not both
- **KMS Key Usage:** CSMS secrets use CSMS's default master key (`csms/default`) by default. Custom KMS keys are optional and only needed for additional encryption control. If `csms_kms_key_id` is not specified and a KMS key is created in the same module, it will automatically use that key
