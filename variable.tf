variable "github_token" {
  description = "Token GitHub"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Région GCP"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zone GCP"
  type        = string
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "Type de machine GCP"
  type        = string
  default     = "e2-micro"
}

variable "vm_image" {
  description = "Image OS des VMs"
  type        = string
  default     = "projects/debian-cloud/global/images/family/debian-12"
}
