# Configure the DNS Provider
provider "dns" {
  update {
    server = "127.0.0.1"
  }
}

locals {
  input_json = {
  for filename, content in fileset("${path.module}/input-json", "*.json") : trim(basename("${content}"), ".json")  => jsondecode(file("${path.module}/input-json/${content}"))
  }
}

module "dns_updater" {

  source = "../../."
# ----------------------------------------
# Write your Terraform module inputs here
# ----------------------------------------
  for_each = local.input_json

  zone      = "${each.value.zone}"
  addresses = each.value.addresses
  ttl       = each.value.ttl
  name      = "${each.key}"
}
