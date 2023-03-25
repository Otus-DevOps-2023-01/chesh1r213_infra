variable subnet_id {
description = "Subnets for modules"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default = "fd89aoebgs0o0127ouur"
}
variable db_disk_image {
  description = ""
  default = "fd8h22cnb2i327bcvim6"
}
variable "count_instance" {
  description = "count instance"
  default     = 1
}
variable "database_url" {
  description = "MongoDB URL"
}
#variable "is_install_service" {
#  description = ""
#}
