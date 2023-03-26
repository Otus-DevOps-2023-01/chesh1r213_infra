provider "yandex" {
  token     = "фывAgфывAвфыв-6RAATuwQфыв_Bu_Nфвыфвфывфыфыв3dDkWeSfSyфывфывфывф4Xb93_Nm-Yыфвrkc"
  cloud_id  = "b1ges86tbese73mej7is"
  folder_id = "b1gktbr7v8hg47vu56vu"
  zone      = "ru-central1-a"
}
module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
  subnet_id       = var.subnet_id
  
}
module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = var.subnet_id
}
  
  
