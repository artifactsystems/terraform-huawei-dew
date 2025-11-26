# HuaweiCloud DEW (Data Encryption Workshop) Terraform Module

Terraform module which creates KMS (Key Management Service) resources on HuaweiCloud.

## Features

This module supports the following DEW/KMS features:

- ✅ **KMS Key Management**: Create and manage symmetric and asymmetric encryption keys
- ✅ **Key Rotation**: Automatic key rotation with configurable intervals (30-365 days)
- ✅ **Key Aliases**: Multiple aliases support for easier key identification
- ✅ **Key Algorithms**: Support for AES_256, SM4, RSA (2048/3072/4096), EC (P256/P384), and SM2
- ✅ **Key Usage Types**: ENCRYPT_DECRYPT and SIGN_VERIFY operations
- ✅ **Key Lifecycle**: Configurable deletion window (7-1096 days)
- ✅ **Tag Management**: Comprehensive tagging support for all resources
- ✅ **Enterprise Project Integration**: Support for HuaweiCloud Enterprise Projects

## Examples

- [complete](./examples/complete) - Complete KMS key setup with rotation and aliases

## Missing Resources (Roadmap)

The following resources are planned for future implementation to achieve feature parity with terraform-aws-kms:

### Planned Features
- [ ] **KMS Grants** (`huaweicloud_kms_grant`) - Delegated key permissions for other principals
- [ ] **Key Material Import** (`huaweicloud_kms_key_material`) - Import your own key material (BYOK)
- [ ] **Dedicated Keystore** (`huaweicloud_kms_dedicated_keystore`) - Hardware Security Module (HSM) backed keys
- [ ] **Data Key Operations** - Data key generation and encryption/decryption operations:
  - `huaweicloud_kms_datakey_without_plaintext` - Generate data key without plaintext
  - `huaweicloud_kms_decrypt_datakey` - Decrypt data key
  - `huaweicloud_kms_encrypt_datakey` - Encrypt data key
  - `huaweicloud_kms_rsa_datakey_pair` - RSA data key pair generation
  - `huaweicloud_kms_ec_datakey_pair` - EC data key pair generation
- [ ] **Cryptographic Operations** - Sign, verify, MAC operations:
  - `huaweicloud_kms_sign` - Digital signature generation
  - `huaweicloud_kms_verify_sign` - Signature verification
  - `huaweicloud_kms_generate_mac` - MAC generation
  - `huaweicloud_kms_verify_mac` - MAC verification
  - `huaweicloud_kms_data_encrypt_decrypt` - Direct data encryption/decryption
- [ ] **Advanced Key Management**:
  - `huaweicloud_kms_cancel_key_deletion` - Cancel scheduled key deletion
  - `huaweicloud_kms_key_update_primary_region` - Update primary region for multi-region keys
  - `huaweicloud_kms_alias_associate` - Associate/disassociate aliases
