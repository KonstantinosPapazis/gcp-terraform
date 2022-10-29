# Create firewall rules
resource "google_compute_firewall" "allow-ingress-from-iap" {
  name        = "allow-ingress-from-iap"
  network     = module.vpc.network_self_link
  description = "Firewall rules to allow IAP"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges   = ["35.235.240.0/20"]
  depends_on = [module.vpc]
}