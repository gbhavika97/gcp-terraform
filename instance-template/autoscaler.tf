resource "google_compute_autoscaler" "demo" {
    name = var.autoscaler-name
    zone = var.zone
    target = google_compute_instance_group_manager.demo.id

    autoscaling_policy {
      max_replicas = 3
      min_replicas = var.minimum_vm_size
      cooldown_period = 30


      cpu_utilization {
        target = 0.72
      }
    }

    depends_on = [google_compute_instance_group_manager.demo ]
  
}