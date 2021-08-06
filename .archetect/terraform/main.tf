terraform {
  required_version = ">= 0.15"
  experiments      = [module_variable_optional_attrs]

  backend "remote" {
    workspaces {
      name = "scaffoldly-bootstrap"
    }
  }
}

module "bootstrap" {
  source  = "scaffoldly/bootstrap/scaffoldly"
  version = "0.15.31"

  root_email   = var.ROOT_EMAIL
  github_token = var.BOOTSTRAP_GITHUB_TOKEN
  organization = var.BOOTSTRAP_ORGANIZATION

  stages = {
    nonlive = {
      domain = "{{ nonlive_domain }}"
    }
    live = {
      domain = "{{ live_domain }}"
    }
  }
}
