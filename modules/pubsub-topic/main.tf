variable "name" {}

resource "google_pubsub_topic" "default" {
  name = var.name

  labels = {
    foo = "bar"
  }
}

output "id" {
  value = google_pubsub_topic.default.id
}
