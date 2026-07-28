component "module_catalog" {
  source = "./module"
}

output "module_catalog" {
    type = list(object({
        name             = string
        provider         = string
        repository       = string
        source_directory = string
    }))
    value = component.module_catalog.module_catalog
}