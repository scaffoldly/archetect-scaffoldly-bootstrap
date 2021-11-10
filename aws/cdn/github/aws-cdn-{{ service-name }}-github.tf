{{ hash-banner }}

module "github_stage_secrets_{{ service_name }}" {
  source  = "scaffoldly/stage-secrets/github"
  version = "1.0.0"

  for_each = module.aws_cdn_{{ service_name }}.stage_config

  stage           = each.key
  repository_name = "{{ repository-name }}"

  secrets = {
    AWS_PARTITION                 = "aws"
    AWS_ACCOUNT_ID                = var.BOOTSTRAP_AWS_ACCOUNT_ID
    AWS_ACCESS_KEY_ID             = module.aws_cdn_{{ service_name }}.deployer_credentials.access_key
    AWS_SECRET_ACCESS_KEY         = module.aws_cdn_{{ service_name }}.deployer_credentials.secret_key
    AWS_CLOUDFRONT_ID             = each.value.distribution_id
  }

  depends_on = [
    module.aws_cdn_{{ service_name }}
  ]
}
