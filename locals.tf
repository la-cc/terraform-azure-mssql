locals {
  server_name = format("%s-%s", var.server_name_prefix, random_id.server_name.hex)
}
