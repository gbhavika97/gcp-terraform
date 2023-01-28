resource "google_compute_backend_service" "demo" {
    name = var.backend-service-name
    port_name = "http"
    protocol = "HTTP"
    timeout_sec = 10

    health_checks = [google_compute_http_health_check.demo.id]

    backend {
      group = google_compute_instance_group_manager.demo.instance_group
      balancing_mode = "RATE"
      capacity_scaler = 1.0
      max_rate_per_instance = 500
    }
  
}
resource "google_compute_http_health_check" "demo" {
    name = "dev-http-health"
    request_path = "/"
    check_interval_sec = 1
    timeout_sec = 1
  
}