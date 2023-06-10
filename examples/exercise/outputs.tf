# ----------------------------------------
# Write your Terraform module outputs here
# ----------------------------------------

output "dns_id" {
    value = [for i in module.dns_updater.name : i.name]
}