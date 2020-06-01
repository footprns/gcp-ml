variable "name" {}
# variable "source_file" {}
variable "policy_data" {}
variable "location" {}

resource "google_storage_bucket" "default" {
  name          = var.name
  location      = var.location
  force_destroy = true
#   bucket_policy_only = true
}

output "id" {
  value = google_storage_bucket.default.id
}



resource "google_storage_bucket_iam_policy" "default" {
  bucket = google_storage_bucket.default.id
  policy_data = var.policy_data
}