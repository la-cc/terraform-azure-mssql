# Introduction:

The module is used to deploy azure over terraform with a default setup (Infrastructure as Code).

# Exmaple Use of Modul:

    module "mssql" {
    source = "github.com/la-cc/terraform-azure-mssql?ref=0.0.0"

    tenant_id               = var.tenant_id
    resource_group_name     = var.resource_group_name
    location                = var.location
    database                = var.database
    admin_object_id         = var.admin_object_id

}
