resource "google_compute_router" "router" {
  name    = "my-router"
  region  = var.region 
  network = module.vpc.network_self_link 

  bgp {
    asn = 64514
  }
  depends_on = [module.vpc]
}

resource "google_compute_router_nat" "nat" {
  name                               = "my-router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    =  module.vpc.subnets_names[0]
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = false
    filter = "ERRORS_ONLY"
  }
  depends_on = [google_compute_router.router]
}