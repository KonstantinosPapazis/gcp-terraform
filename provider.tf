provider "google" {
  project = "coastal-dynamo-367018"
}

provider "google-beta" {
  project = "coastal-dynamo-367018"
}

terraform {
  backend "gcs" {
    bucket = "tf-bucket-coastal-dynamo-367018"
    prefix = "terraform/state"
  }
}