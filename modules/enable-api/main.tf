variable "project" {}
variable "service" {}


resource "google_project_service" "default" {
  project = var.project
  service = var.service
  disable_dependent_services = true
  disable_on_destroy = true
}