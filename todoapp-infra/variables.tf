variable "rg_name" {
  description = "The name of the resource group"
  type        = string

}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "West Europe"
}
variable "sql_server_name" {
  type        = string
  description = "The name of the SQL Server"

}
variable "sql_database_name" {
  type        = string
  description = "The name of the SQL Database"
}
variable "vault_name" {
  description = "The name of key vault"
  type        = string

}

# variable "rbac_principal_id" {
# }

variable "vm_username" {
  type        = string
  sensitive   = true
  description = "VM username"

}
variable "vm_password" {
  type        = string
  sensitive   = true
  description = "VM username and password"

}
variable "sql_username" {
  type        = string
  sensitive   = true
  description = "SQL Server username"

}
variable "sql_password" {
  type        = string
  sensitive   = true
  description = "SQL Server password"
}

# variable "vnet" {

# }
variable "vnet_name" {
  description = "Name of the VNet"
  default     = "todo-vnet"
  type        = string
}

variable "address_space" {
  type        = list(string)
  description = "value for address space of the VNet"

}

variable "vm" {
  type        = map(any)
  description = "Map of VM configurations"
}

# variable "vms" {}

variable "public_ip" {
  description = "Map of public IPs for VMs"
  type        = map(any)
}

variable "subnet" {
  description = "Map of subnet names for VMs"
  type        = map(any)
}
# variable "subnet_ids" {

# }