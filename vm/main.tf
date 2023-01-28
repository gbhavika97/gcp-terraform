resource "google_compute_network" "vpc" {
    name = var.vpc-name
    auto_create_subnetworks = false
  
}
resource "google_compute_subnetwork" "subnet-1" {
    name = var.subnet
    region = var.region
    network = google_compute_network.vpc.name
    ip_cidr_range = var.ip_cidr_range
  
}
resource "google_compute_firewall" "allow-http" {
    name = "${google_compute_network.vpc.name}-allow-http"
    network = google_compute_network.vpc.name
    allow {
      protocol = "tcp"
      ports = ["80"]
    }
    target_tags = [ "http-server" ]
    source_ranges = [ "0.0.0.0/0" ]
  
}
resource "google_compute_firewall" "allow-https" {
    name = "${google_compute_network.vpc.name}-allow-https"
    network = google_compute_network.vpc.name
    allow {
      protocol = "tcp"
      ports = ["443"]
    }
    target_tags = [ "https-server" ]
    source_ranges = [ "0.0.0.0/0" ]
  
}
resource "google_compute_firewall" "allow-ssh" {
    name = "${google_compute_network.vpc.name}-allow-ssh"
    network = google_compute_network.vpc.name
    allow {
      protocol = "tcp"
      ports = ["22"]
    }
    target_tags = [ "ssh" ]
    source_ranges = [ "0.0.0.0/0" ]
  
}
resource "google_compute_instance" "vm_instance" {
    name = var.vm-name
    machine_type = var.machine_type
    tags = [ "ssh","http-server" ,"https-server"]
    boot_disk {
      initialize_params {
        image = var.image
      }
    }


    network_interface {
      network = google_compute_network.vpc.self_link
      subnetwork = google_compute_subnetwork.subnet-1.self_link
      access_config {
        nat_ip = google_compute_address.vm_static_ip.address
        
      }
    }
  
}
resource "google_compute_address" "vm_static_ip" {
    name = var.vm_static_ip
  
}
