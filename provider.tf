provider "google" {
  credentials = file("~/.config/gcloud/application_default_credentials.json")
  project     = var.project
  region      = var.region
}

provider "google-beta" {
  credentials = file("~/.config/gcloud/application_default_credentials.json")
  project     = var.project
  region      = var.region
}