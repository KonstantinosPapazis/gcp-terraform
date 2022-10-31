module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 4.0"

  project_id   = "coastal-dynamo-367018"
  network_name = "vpc-01"
  routing_mode = "REGIONAL"

  subnets = [
    {
      subnet_name           = "subnet-01"
      subnet_ip             = "10.10.10.0/24"
      subnet_region         = "europe-west1"
      subnet_private_access = "true"
    },
    {
      subnet_name           = "subnet-02"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = "europe-west1"
      subnet_private_access = "true"
      description           = "This subnet has a description"
    },
  ]
}