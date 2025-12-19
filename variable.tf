variable "github_token" {
  type      = string
  sensitive = true
}

variable "region" {
  default = "europe-west1"
}
variable "zone" {
  default = "europe-west1-b"
}