terraform {
  required_version = ">= 1.3.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.gcp_region
}

resource "google_storage_bucket" "practice" {
  name                        = "${var.name_prefix}-practice-${var.project_id}"
  location                    = var.gcp_region
  force_destroy               = true
  uniform_bucket_level_access = true
}

resource "google_logging_project_bucket_config" "basic" {
  project        = var.project_id
  location       = "global"
  retention_days = 30
  bucket_id      = "${var.name_prefix}-logs"
}
