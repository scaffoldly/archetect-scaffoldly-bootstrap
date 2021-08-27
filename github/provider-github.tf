{{ hash-banner }}

variable "BOOTSTRAP_GITHUB_TOKEN" {
  type = string
}

provider "github" {
  token = var.BOOTSTRAP_GITHUB_TOKEN
  owner = var.BOOTSTRAP_ORGANIZATION
}
