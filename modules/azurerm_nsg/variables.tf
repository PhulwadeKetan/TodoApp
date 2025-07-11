variable "location" {
type = string
}
variable "rg_name" {
type = string
}
variable "subnet" {
type = map(any)
}
variable "vnet_name" {
type = string
}
# variable "vms" {}