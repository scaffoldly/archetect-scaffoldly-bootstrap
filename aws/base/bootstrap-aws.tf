{{ hash-banner }}

variable "BOOTSTRAP_AWS_ACCOUNT_ID" {
  type        = string
  description = "AWS Account ID in which to create resources"
}

module "bootstrap_aws" {
  source  = "scaffoldly/bootstrap/aws"
  version = "1.0.26"

  root_email   = var.ROOT_EMAIL
  account_id   = var.BOOTSTRAP_AWS_ACCOUNT_ID
  organization = var.BOOTSTRAP_ORGANIZATION

  {% if serverless-api-subdomain != "" %}serverless_api_subdomain = "{{ serverless-api-subdomain }}"{% endif %}

  stages = {
    nonlive = {
      domain = "{{ nonlive-domain }}"
      {% if nonlive-subdomain-suffix != "" %}subdomain_suffix = "{{ nonlive-subdomain-suffix }}"{% endif %}
      {% if nonlive_cdn_domains_formatted != '"[]"' %}cdn_domains = [{{ nonlive_cdn_domains_formatted }}]{% endif %}
    }
    {% if live-domain != "" %}live = {
      domain = "{{ live-domain }}"
      {% if live-subdomain-suffix != "" %}subdomain_suffix = "{{ live-subdomain-suffix }}"{% endif %}
      {% if live_cdn_domains_formatted != '"[]"' %}cdn_domains = [{{ live_cdn_domains_formatted }}]{% endif %}
    }{% endif %}
  }
}

provider "aws" {
  alias  = "root"
  region = "us-east-1"
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

output "bootstrap_aws_cdn_stages" {
  value = module.bootstrap_aws.cdn_stages
}

output "bootstrap_aws_kms_stages" {
  value = module.bootstrap_aws.kms_stages
}
