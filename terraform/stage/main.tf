provider "yandex" {
  token     = "y0_AgAAAAAiV-6RAATuwQAAAADc8_Bu_N3dDkWeSfSy4Xb93_Nm-YXWrkc"
  cloud_id  = "b1ges86tbese73mej7is"
  folder_id = "b1gktbr7v8hg47vu56vu"
  zone      = "ru-central1-a"
}
module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
  subnet_id       = "e9busgcgopum2hiasp01"
  
}
module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = "e9busgcgopum2hiasp01"
}
  
  
