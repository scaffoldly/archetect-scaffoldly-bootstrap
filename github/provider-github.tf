{{ hash-banner }}

variable "BOOTSTRAP_GITHUB_TOKEN" {
  type = string
}

provider "github" {
  owner = var.BOOTSTRAP_ORGANIZATION
  token = var.BOOTSTRAP_GITHUB_TOKEN
}
