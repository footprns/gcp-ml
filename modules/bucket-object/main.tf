variable "name" {}
variable "source_file" {}
variable "bucket" {}


resource "google_storage_bucket_object" "default" {
  name   = var.name
  source = var.source_file
  bucket = var.bucket
}

output "self_link" {
  value = google_storage_bucket_object.default.self_link
}
