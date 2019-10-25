//COnfig the GCP
provider "google" {
 credentials = "${file("CREDENTIALS_FILE.json")}"
 project     = "terraform-257013"
 region      = "us-west1"
}


resource "random_id" "instance_id" {
 byte_length = 8
}

//Comment here
resource "google_compute_instance" "default" {
 name         = "terraform-vm-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = "us-west1-a"

 boot_disk {
  initialize_params {
   image = "ubuntu-os-cloud/ubuntu-1804-lts"
  }
 }


 metadata_startup_script = "sudo apt-get update; sudo apt-get install php-fpm; sudo apt install nginx; sudo apt install mariadb-server"

 network_interface {
  network = "default"

  access_config {
 
  }
 } 
 metadata = {
  ssh-keys = "artishok:${file("~/.ssh/id_rsa.pub")}"
 }
}


output "ip" {
 value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}
