provider "google" {
    region = "us-east1" # Change if needed"
    zone = "us-east1-b" # Change if needed"
    credentials = file("~/Desktop/terraform-code/starry-battery-311303-e47b8df09b74.json")
    project = "starry-battery-311303"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}