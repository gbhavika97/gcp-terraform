resource "google_compute_instance_group_manager" "demo" {
    name = var.name
    base_instance_name = var.name
    zone = var.zone

    version {
      instance_template = google_compute_instance_template.demo.id
    }
    target_size = var.minimum_vm_size

    named_port {
      name = "web"
      port = 80
    }

    auto_healing_policies {
      health_check = google_compute_health_check.dev_health.id
      initial_delay_sec = 60
    }

  
}
resource "google_compute_health_check" "dev_health" {
    name = "dev-health"
    check_interval_sec = 5
    timeout_sec = 5
    healthy_threshold = 2
    unhealthy_threshold = 10


    http_health_check {
      request_path = "/"
      port = "80"
    }

  
}