variable "tenant_id" {
  type        = string
  description = "The Tenant ID for the Service Principal associated with the Identity of this SQL Server."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Microsoft SQL Server."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "server_name_prefix" {
  type        = string
  description = "Prefix for the SQL server name, followed by a random ID"
  default     = "mssqlserver"
}

variable "server_version" {
  type        = string
  description = "Version of the SQL server"
  default     = "12.0"
}


variable "database" {
  type = map(object({
    name                             = string
    edition                          = string
    requested_service_objective_name = string
  }))

  default = {}
}

variable "admin_login_name" {
  type        = string
  default     = "sqladmin"
  description = "The login name of the principal to set as the server administrator."
}

variable "admin_object_id" {
  type        = string
  description = "Object ID of the user or group to set as the server administrator."
}

variable "tags" {
  type = map(string)
  default = {
    TF-Managed  = "true"
    TF-Worfklow = ""
    Maintainer  = ""

  }
  description = "A mapping of tags to assign to the resource."
}
