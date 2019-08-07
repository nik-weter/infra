provider "google" {
  project = "${var.project}"
  region  = "${var.region}"

}
resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }
  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"
    # использовать ephemeral IP для доступа из Интернет
    access_config {
      nat_ip = "${google_compute_address.app_ip.address}"
    }
  }
  metadata = {
    sshKeys = "appuser:${file(var.public_key_path)}"

  }
  tags = ["reddit-app"]
  connection {
    type        = "ssh"
    host        = "${self.network_interface.0.access_config.0.nat_ip}"
    user        = "appuser"
    agent       = false
    private_key = "${file(var.private_key_path)}"
  }
 }

resource "google_compute_firewall" "firewall_ssh" {
  name = "default-allow-ssh"
  network = "default"
    allow {
      protocol = "tcp"
      ports = ["22"]
    }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}

