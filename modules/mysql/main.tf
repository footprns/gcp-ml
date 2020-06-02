variable "name" {}
variable "database_version" {}
variable "username" {}
variable "password" {}

resource "google_sql_database_instance" "default" {
  name             = var.name
  database_version = var.database_version
#   region           = "us-central1"

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "default" {
  name     = var.name
  instance = google_sql_database_instance.default.name
}

resource "google_sql_user" "default" {
  name     = var.username
  instance = google_sql_database_instance.default.name
  password = var.password
}

output "name" {
  value = google_sql_database_instance.default.name
}

output "username" {
  value = google_sql_user.default.name
}

output "password" {
  value = google_sql_user.default.password
}

