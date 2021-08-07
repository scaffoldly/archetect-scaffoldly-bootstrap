terraform {
  required_version = ">= 1.0.4, < 1.1.0"
  experiments      = [module_variable_optional_attrs]

  backend "remote" {
    workspaces {
      name = "scaffoldly-bootstrap"
    }
  }
}

module "bootstrap_aws" {
  source  = "scaffoldly/bootstrap/aws"
  version = "1.0.1"

  root_email   = var.ROOT_EMAIL
  account_id   = var.BOOTSTRAP_AWS_ACCOUNT_ID
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
