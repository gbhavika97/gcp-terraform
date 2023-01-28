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