
resource "yandex_compute_instance" "db" {
  name = "reddit-db" 
  labels = {
    tags = "reddit-db"
  }
  resources {
    cores  = 2
    memory = 2
}
  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
}

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
connection {
    type  = "ssh"
    host  = self.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file("../modules/app/ubuntu")
  }
provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sleep 20",
      "sudo apt install mongodb",
      "sudo sed -i 's/127.0.0.1/127.0.0.1,${yandex_compute_instance.db.network_interface.0.nat_ip_address}/g' /etc/mongodb.conf",
      "sudo systemctl restart mongodb"

    ]
  
}
}
