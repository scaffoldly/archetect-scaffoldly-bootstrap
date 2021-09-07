{{ hash-banner }}

variable "BOOTSTRAP_AWS_ACCOUNT_ID" {
  type        = string
  description = "AWS Account ID in which to create resources"
}

module "bootstrap_aws" {
  source  = "scaffoldly/bootstrap/aws"
  version = "1.0.7"

  root_email   = var.ROOT_EMAIL
  account_id   = var.BOOTSTRAP_AWS_ACCOUNT_ID
  organization = var.BOOTSTRAP_ORGANIZATION

  stages = {
    nonlive = {
      domain = "{{ nonlive-domain }}"
    }
    live = {
      domain = "{{ live-domain }}"
    }
  }
}

provider "aws" {
  alias = "root"
}

provider "aws" {
  region = module.bootstrap_aws.region

  assume_role {
    role_arn = module.bootstrap_aws.role
  }
}

output "bootstrap_aws_api_gateway_stages" {
  value = module.bootstrap_aws.api_gateway_stages
}
