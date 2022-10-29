provider "google" {
  project = "coastal-dynamo-367018"  // Put your Project ID here
}

terraform {
  backend "gcs" {
    bucket  = "tf-bucket-coastal-dynamo-367018"
    prefix  = "terraform/state"
  }
}