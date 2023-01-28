resource "google_compute_instance_template" "demo" {
    name = "my-template-1"

    tags = [ "foo","bar" ]

    labels = {
      "environment" = "dev"
    }
    machine_type = var.machine_type
    can_ip_forward = false


    scheduling {
        automatic_restart = true
        on_host_maintenance = "MIGRATE"

    }

    #Create new boot disk from an image
    disk {
        source_image = "debian-cloud/debian-11"
        auto_delete = true
        boot = true
    }

    #Use existing disk resource
    /*disk {
      source = google_compute_disk.foobar.name
      auto_delete = false
      boot = false
    }*/

    network_interface {
        network = google_compute_network.vpc.self_link
        subnetwork = google_compute_subnetwork.subnet-1.self_link
    }

    lifecycle {
      create_before_destroy = true
    }

}
data "google_compute_image" "my-image" {
    family = "debian-11"
    project = "debian-cloud"
  
}
resource "google_compute_disk" "foobar" {
    name = "existing-disk"
    image = data.google_compute_image.my-image.self_link
    size = 10
    type = "pd-ssd"
    zone = var.zone
  
}
 #Create instance from instance template
 resource "google_compute_instance_from_template" "demo" {
    name = "my-vm-template"
    zone = var.zone

    source_instance_template = google_compute_instance_template.demo.id

    #Override fields from instance templates
    can_ip_forward = false
    labels = {
      "environment" = "staging"
    }
 }