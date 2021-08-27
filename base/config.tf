{{ hash-banner }}

terraform {
  required_version = ">= 1.0.4, < 1.1.0"
  experiments      = [module_variable_optional_attrs]

  backend "remote" {
    workspaces {
      name = "scaffoldly-bootstrap"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.55.0"
    }
    github = {
      source  = "integrations/github"
      version = "4.13.0"
    }
  }
}

variable "ROOT_EMAIL" {
  type        = string
  description = "Root email address"
}

variable "BOOTSTRAP_ORGANIZATION" {
  type        = string
  description = "GitHub/Terraform Cloud Organization"
}
