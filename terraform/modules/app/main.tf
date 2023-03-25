resource "yandex_compute_instance" "app" {
	name =  "reddit-apps"
 	labels = {
    	tags = "reddit-app"
  	}
  	resources {
    		cores  = 2
    		memory = 2
	}

boot_disk {
    		initialize_params {
      		image_id = var.app_disk_image
	} 
}

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
	
  	network_interface {
    		subnet_id = var.subnet_id
    		nat = true
	}
connection {
    type  = "ssh"
    host  = self.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file("~/.ssh/ubuntu")
  }

  provisioner "remote-exec" {
    inline = [
      "export DATABASE_URL=${var.database_url}:27017"
    ]
  }

  provisioner "file" {
    source      = "../modules/app/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "../modules/app/deploy.sh"
  }

}

