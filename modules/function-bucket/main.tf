variable "zipfile" {}
variable "bucket" {}
variable "_source" {}

resource "google_storage_bucket_object" "default" {
  name   = var.zipfile
  bucket = var.bucket
  source = var._source
}

variable "name" {}
variable "description" {}
variable "runtime" {}
variable "entry_point" {}
variable "source_archive_bucket" {}
variable "event_type" {}
variable "resource" {}


resource "google_cloudfunctions_function" "default" {
  name        = var.name
  description = var.description
  runtime     = var.runtime

  available_memory_mb   = 256
  source_archive_bucket = var.source_archive_bucket
  source_archive_object = google_storage_bucket_object.default.name
  timeout               = 60
  entry_point           = var.entry_point
  event_trigger {
    event_type = var.event_type
    resource = var.resource
  }
  labels = {
    my-label = "my-label-value"
  }

  environment_variables = {
    MY_ENV_VAR = "my-env-var-value"
  }
}

# IAM entry for a single user to invoke the function
resource "google_cloudfunctions_function_iam_member" "default" {
  cloud_function = google_cloudfunctions_function.default.name

  role   = "roles/cloudfunctions.invoker"
#   member = "user:myFunctionInvoker@example.com"
  member = "allUsers"
}