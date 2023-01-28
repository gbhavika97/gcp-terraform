resource "google_compute_managed_ssl_certificate" "demo" {
    provider = google
    name = "my-ssl-cert"

    managed {
      domains = [var.domain-name]
    }
  
}