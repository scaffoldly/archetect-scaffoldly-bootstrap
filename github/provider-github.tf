{{ hash-banner }}

variable "BOOTSTRAP_GITHUB_TOKEN" {
  type = string
}

provider "github" {
  # GITHUB_OWNER is set by scaffoldly/bootstrap-action
  token = var.BOOTSTRAP_GITHUB_TOKEN
}
