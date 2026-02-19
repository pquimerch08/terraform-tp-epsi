# ─────────────────────────────────────
# GITHUB
# ─────────────────────────────────────
output "github_repo_url" {
  description = "URL du repo GitHub"
  value       = github_repository.demo.html_url
}

# ─────────────────────────────────────
# VMs GCP (désactivé - API payante)
# ─────────────────────────────────────
# output "vm1_name" {
#   description = "Nom de la VM1"
#   value       = google_compute_instance.vm1.name
# }

# output "vm1_ip_interne" {
#   description = "IP interne VM1"
#   value       = google_compute_instance.vm1.network_interface[0].network_ip
# }

# output "vm1_ip_externe" {
#   description = "IP externe VM1"
#   value       = google_compute_instance.vm1.network_interface[0].access_config[0].nat_ip
# }

# output "vm2_name" {
#   description = "Nom de la VM2"
#   value       = google_compute_instance.vm2.name
# }

# output "vm2_ip_interne" {
#   description = "IP interne VM2"
#   value       = google_compute_instance.vm2.network_interface[0].network_ip
# }

# output "vm2_ip_externe" {
#   description = "IP externe VM2"
#   value       = google_compute_instance.vm2.network_interface[0].access_config[0].nat_ip
# }
