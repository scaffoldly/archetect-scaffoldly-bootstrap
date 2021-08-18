## THIS FILE IS AUTOMATICALLY GENERATED BY SCAFFOLDLY    ##
## CONFIG CAN BE CHANGED HERE: https://start.scaffold.ly ##

variable "BOOTSTRAP_AWS_ACCOUNT_ID" {
  type        = string
  description = "AWS Account ID in which to create resources"
}

module "bootstrap_aws" {
  source  = "scaffoldly/bootstrap/aws"
  version = "1.0.2"

  root_email   = var.ROOT_EMAIL
  account_id   = var.BOOTSTRAP_AWS_ACCOUNT_ID
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

provider "aws" {
  region = module.boostrap_aws.region

  assume_role {
    role_arn = module.bootstrap_aws.role
  }
}
