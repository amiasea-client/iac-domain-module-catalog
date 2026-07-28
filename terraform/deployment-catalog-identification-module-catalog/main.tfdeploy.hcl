deployment "default" {}

publish_output "module_catalog" {
  # Omit type constraints here too; let the underlying pipeline pass the schema up
  value       = deployment.default.module_catalog
  description = "Exposed catalog data for downstream stacks"
}

# test
