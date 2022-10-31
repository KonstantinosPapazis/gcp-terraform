resource "google_service_account" "custom-compute" {
  account_id   = "custom-service-account"
  display_name = "A custom testservice account"
}


resource "google_project_iam_member" "member-role" {
  for_each = toset([
    "roles/compute.admin",
    "roles/storage.admin",
  ])
  role = each.key
  member = "serviceAccount:${google_service_account.custom-compute.email}"
  project = var.project_id
}