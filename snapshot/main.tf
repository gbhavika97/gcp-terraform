resource "google_compute_snapshot" "snapshot" {
    name = var.snapshot-name
    source_disk = google_compute_disk.persistent.id
    zone = var.zone
    labels = {
      "my_label" = "my_value"
    }
    storage_locations = [ "us-west4" ]
  
}
data "google_compute_image" "debian" {
    family = "debian-11"
    project = "debian-cloud"
  
}

resource "google_compute_disk" "persistent" {
    name = "debian-disk"
    image = data.google_compute_image.debian.self_link
    size = 10
    type = "pd-ssd"
    zone = var.zone
  
}
