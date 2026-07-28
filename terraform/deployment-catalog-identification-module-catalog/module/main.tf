locals {
  module_paths = distinct([
    for path in fileset(
      "${path.root}/terraform/modules",
      "**"
    ) :
    regex("^([^/]+)/", path)[0]
  ])

  module_catalog = [
    for module_path in sort(local.module_paths) : {
      name             = module_path
      provider         = ""
      repository       = "iac-module-catalog"
      source_directory = "terraform/modules/${module_path}"
    }
  ]
}

output "module_catalog" {
  value = local.module_catalog
}