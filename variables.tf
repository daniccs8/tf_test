# ------------------------------------------
# Write your Terraform variable inputs here
# ------------------------------------------

variable "zone" {
    type = string  
}

variable "addresses" {
  type = list(string)
}

variable "ttl" {
  type = number
}

variable "name" {
  type = string
  default = "www"
}