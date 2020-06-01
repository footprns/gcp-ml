variable "account_id" {}

resource "google_service_account" "default" {
  account_id   = var.account_id
  display_name = var.account_id
}

resource "google_service_account_key" "default" {
  service_account_id = google_service_account.default.account_id
  public_key_type    = "TYPE_X509_PEM_FILE"
}

output "private_key" {
  value = google_service_account_key.default.private_key
}
output "email" {
  value = google_service_account.default.email
}
