resource "google_compute_disk" "disk" {
    name = var.disk-name
    type = var.disk-type
    zone = var.zone
    image = var.image
    labels = {
      "environment" = "dev"
    }
  
}