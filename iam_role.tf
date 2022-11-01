resource "google_project_iam_custom_role" "list-buckets-role" {
  role_id     = "storage.bucketsReader"
  title       = "Custom Bucket Reader"
  description = "my custom bucket list role"
  permissions = [
    "storage.buckets.list", 
  ]
}