terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = "pquimerch08"
}

provider "google" {
  credentials = file("key.json")   # clé du service account GCP
  project     = "playground-s-11-68a6505a"
  region      = var.region
  zone        = var.zone
}

resource "github_repository" "demo" {
  name        = "terraform-repo"
  description = "Repo créé via Terraform"
  visibility  = "public"
}

resource "google_compute_network" "vpc" {
  name = "vpc-terraform-pol"
}

resource "google_compute_instance" "vm_demo" {
  name         = "terraform-vm-pol"
  machine_type = "e2-micro"
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-12"
    }
  }
    network_interface {
    network = "default"
    access_config {}
  }

  tags = ["terraform", "demo"]
}
