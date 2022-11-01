resource "google_storage_bucket" "bucket1" {
  name     = "test-bucket-abc"
  location = "EUROPE-WEST1"
}

resource "google_service_account" "custom-disk" {
  account_id   = "custom-service-account-bucket"
  display_name = "A custom testservice account for bucket"
}

#One way to assign iam to a bucket

#resource "google_storage_bucket_iam_binding" "binding" {
#  bucket = google_storage_bucket.bucket1.name
#  role = "roles/storage.admin"
#  members = [
#    "serviceAccount:${google_service_account.custom-disk.email}",
#    #"user:kpapazis84@gmail.com",
#  ]
#  depends_on = [
#    google_service_account.custom-disk
#  ]
#}

resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.bucket1.name
  role = google_project_iam_custom_role.list-buckets-role.id
  members = [
    "serviceAccount:${google_service_account.custom-disk.email}",
    #"user:kpapazis84@gmail.com",
  ]
  depends_on = [
    google_service_account.custom-disk
  ]
}

#Second way to assign iam to the bucket 

#resource "google_storage_bucket_iam_member" "member" {
#  bucket = google_storage_bucket.bucket1.name
#  role = "roles/storage.admin"
#  member = "user:kpapazis84@gmail.com"
#}

#More advanced scenario

#data "google_iam_policy" "admin" {
#  binding {
#    role = "roles/storage.admin"
#    members = [
#      "user:kpapazis84@gmail.com",
#    ]
#  }
#}
#
#resource "google_storage_bucket_iam_policy" "policy" {
#  bucket      = google_storage_bucket.bucket1.name
#  policy_data = data.google_iam_policy.admin.policy_data
#}