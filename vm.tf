resource "google_compute_instance" "default" {
  project      = var.project_id # Replace this with your project ID in quotes
  zone         = var.zone
  name         = "instance-1"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  network_interface {
    network = module.vpc.network_self_link  #"default"
    subnetwork = module.vpc.subnets_names[0] #subnets[0] #.0 #[0]
  }
  tags = ["health-check", "ssh"]
  metadata_startup_script = "sudo apt update; sudo apt install -y nginx;"
  depends_on = [module.vpc]
}