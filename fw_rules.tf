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

resource "google_compute_firewall" "allow-ingress-from-http" {
  name        = "allow-ingress-from-http"
  network     = module.vpc.network_self_link
  description = "Firewall rules to allow http"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges   = ["0.0.0.0/0"]
  depends_on = [module.vpc]
}

resource "google_compute_firewall" "allow-interssh" {
  name        = "allow-ininterssh"
  network     = module.vpc.network_self_link
  description = "Firewall rules to allow ssh"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges   = ["10.10.10.0/24"]
  depends_on = [module.vpc]
}