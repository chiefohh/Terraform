provider "google" {
  credentials = file(var.credentials)
  project  = "mayowa-student-account-2"
  region  = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
    name = "myfirst-terraforminstnce2"
    machine_type = "e2-micro"
    zone = "us-central1-a"
    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-11"
      }
    }
    network_interface {
      network = "default"
      access_config {}
    }
}

output "instance_ip" {
  value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}

variable "credentials" {
    type = string
    default = "C:\\Users\\mayow\\Documents\\DevOps Training\\Mayowa\\mayowa-student-account-2-86f36b0b45b3m.json"
    
}