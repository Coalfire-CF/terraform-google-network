terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.70, < 5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.70, < 5.0"
    }
  }
  backend "gcs" {
    bucket = "your-state-bucket"
    prefix = "terraform/state/networking"
  }
}