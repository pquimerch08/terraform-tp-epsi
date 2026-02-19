terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
    # google = {
    #   source  = "hashicorp/google"
    #   version = "~> 6.0"
    # }
  }
}

# ─────────────────────────────────────
# PROVIDERS
# ─────────────────────────────────────
provider "github" {
  token = var.github_token
  owner = "pquimerch08"
}

# provider "google" {
#   credentials = file("key.json")
#   project     = "gen-lang-client-0974451693"
#   region      = var.region
#   zone        = var.zone
# }

# ─────────────────────────────────────
# GITHUB REPOSITORY
# ─────────────────────────────────────
resource "github_repository" "demo" {
  name        = "terraform-repo"
  description = "Repo créé via Terraform"
  visibility  = "public"
}

# ─────────────────────────────────────
# RÉSEAU GCP (désactivé - API payante)
# ─────────────────────────────────────
# resource "google_compute_network" "vpc" {
#   name                    = "vpc-terraform-pol"
#   auto_create_subnetworks = true
# }

# resource "google_compute_firewall" "allow_ssh" {
#   name    = "allow-ssh-terraform"
#   network = google_compute_network.vpc.name
#   allow {
#     protocol = "tcp"
#     ports    = ["22"]
#   }
#   source_ranges = ["0.0.0.0/0"]
#   target_tags   = ["terraform", "demo"]
# }

# resource "google_compute_firewall" "allow_icmp" {
#   name    = "allow-icmp-terraform"
#   network = google_compute_network.vpc.name
#   allow {
#     protocol = "icmp"
#   }
#   source_ranges = ["0.0.0.0/0"]
#   target_tags   = ["terraform", "demo"]
# }

# ─────────────────────────────────────
# VMs GCP (désactivé - API payante)
# ─────────────────────────────────────
# resource "google_compute_instance" "vm1" {
#   name         = "terraform-vm-01"
#   machine_type = var.machine_type
#   zone         = var.zone
#   boot_disk {
#     initialize_params {
#       image = var.vm_image
#       size  = 10
#     }
#   }
#   network_interface {
#     network = google_compute_network.vpc.name
#     access_config {}
#   }
#   metadata = {
#     ssh-keys = "debian:${file("~/.ssh/id_rsa.pub")}"
#   }
#   tags = ["terraform", "demo"]
# }

# resource "google_compute_instance" "vm2" {
#   name         = "terraform-vm-02"
#   machine_type = var.machine_type
#   zone         = var.zone
#   boot_disk {
#     initialize_params {
#       image = var.vm_image
#       size  = 10
#     }
#   }
#   network_interface {
#     network = google_compute_network.vpc.name
#     access_config {}
#   }
#   metadata = {
#     ssh-keys = "debian:${file("~/.ssh/id_rsa.pub")}"
#   }
#   tags = ["terraform", "demo"]
# }
