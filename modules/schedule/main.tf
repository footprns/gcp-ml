variable "name" {}
variable "description" {}
variable "schedule" {}
variable "topic_name" {}

resource "google_cloud_scheduler_job" "job" {
  name        = var.name
  description = var.description
  schedule    = var.schedule

  pubsub_target {
    # topic.id is the topic's full resource name.
    topic_name = var.topic_name
    data       = base64encode("test")
  }
}