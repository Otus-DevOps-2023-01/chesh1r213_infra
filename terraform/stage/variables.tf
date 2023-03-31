variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable token {
  # Описание переменной
  description = "token ya"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable subnet_id {
  # Описание переменной
  description = "sub"
  
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default = "fd89aoebgs0o0127ouur"
}
variable db_disk_image {
  description = ""
  default = "fd8h22cnb2i327bcvim6"
}

