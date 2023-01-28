resource "google_compute_global_address" "demo" {
    name = "web-lb-ip"

}
resource "google_compute_url_map" "http" {
    name = "web-http"

    default_url_redirect {
      redirect_response_code = "MOVED_PERMANENTLY_DEFAULT"
      strip_query = false
      https_redirect = true
    }
  
}
resource "google_compute_target_http_proxy" "http" {
    name = "web-http"
    url_map = google_compute_url_map.http.self_link
  
}
resource "google_compute_global_forwarding_rule" "http" {
    name = "web-http"
    target = google_compute_target_http_proxy.http.self_link
    ip_address = google_compute_global_address.demo.address
    port_range = "80"
  
}
resource "google_compute_url_map" "https" {
    name = "web-https"
    default_service = google_compute_backend_service.demo.id
  
}
resource "google_compute_target_https_proxy" "https" {
    name = "web-https"
    url_map = google_compute_url_map.https.id
    ssl_certificates = [google_compute_managed_ssl_certificate.demo.id]
  
}
resource "google_compute_global_forwarding_rule" "https" {
    name = "web-https"
    target = google_compute_target_https_proxy.https.id
    ip_address = google_compute_global_address.demo.address
    port_range = "443"
  
}
