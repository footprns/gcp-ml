/*
variable "project" {}
variable "location_id" {}

resource "google_app_engine_application" "default" {
  project     = var.project
  location_id = var.location_id
}
*/
variable "runtime" {}
variable "source_url" {}
variable "version_id" {}
variable "service" {}
variable "shell" {}
variable "env_variables" {
  type = map
}


resource "google_app_engine_standard_app_version" "default" {
  runtime    = var.runtime
  version_id = var.version_id
  service = var.service
  deployment {
    zip {
      source_url = var.source_url
    }
  }
  entrypoint {
    shell = var.shell
  }
  env_variables = var.env_variables
  automatic_scaling {
    max_concurrent_requests = 10
    min_idle_instances = 1
    max_idle_instances = 3
    min_pending_latency = "1s"
    max_pending_latency = "5s"
    standard_scheduler_settings {
      target_cpu_utilization = 0.5
      target_throughput_utilization = 0.75
      min_instances = 1
      max_instances = 2
    }
  }
  # delete_service_on_destroy = true
    lifecycle {
    create_before_destroy = true
  }
}

/*
resource "google_app_engine_service_split_traffic" "default" {
  service = google_app_engine_standard_app_version.default.service

  migrate_traffic = false
  split {
    shard_by = "IP"
    allocations = {
      (google_app_engine_standard_app_version.default.version_id) = 1
    }
  }
}
*/


