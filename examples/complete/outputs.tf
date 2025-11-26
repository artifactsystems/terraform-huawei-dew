output "example_key_id" {
  description = "Identifier of the created example DEW key"
  value       = module.dew.key_id
}

output "example_aliases" {
  description = "Aliases generated for the example DEW key"
  value       = module.dew.aliases
}
