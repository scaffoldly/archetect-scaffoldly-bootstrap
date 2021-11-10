{{ hash-banner }}

module "aws_cdn_{{ service_name }}" {
  source  = "scaffoldly/cdn/aws"
  version = "1.0.1"

  service_slug     = "{{ service-slug }}"
  repository_name  = "{{ repository-name }}"
  logs_bucket_name = module.bootstrap_aws.logs_bucket
  cdn_stages       = module.bootstrap_aws.cdn_stages

  depends_on = [
    module.bootstrap_aws
  ]
}

output "{{ repository-name }}_cdn_config_aws" {
  value = module.aws_cdn_{{ service_name }}.stage_config
}

output "{{ repository-name }}_deployer_credentials_aws" {
  value     = module.aws_cdn_{{ service_name }}.deployer_credentials
  sensitive = true
}
