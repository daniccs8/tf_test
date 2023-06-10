# Configure the DNS Provider
provider "dns" {
  update {
    server = "127.0.0.1"
  }
}

locals {
dns_input = {
    for file in fileset("${path.module}/input-json", "*.json") : basename("${file}") => jsondecode(file("${path.module}/input-json/${file}"))
  }
}

module "dns_updater" {

  source = "../../."
# ----------------------------------------
# Write your Terraform module inputs here
# ----------------------------------------
  for_each = local.dns_input

  zone      = each.value.zone
  addresses = each.value.addresses
  ttl       = each.value.ttl
  name      = var.name
}
