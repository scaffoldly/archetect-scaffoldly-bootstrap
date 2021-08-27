{{ hash-banner }}

module "github_stage_secrets_{{ service_name }}" {
  source  = "scaffoldly/stage-secrets/github"
  version = "1.0.0"

  for_each = module.aws_serverless_api_{{ service_name }}.stage_config

  stage           = each.key
  repository_name = "{{ repository-name }}"

  secrets = {
    AWS_PARTITION                 = data.aws_partition.current.partition
    AWS_ACCOUNT_ID                = data.aws_caller_identity.current.account_id
    AWS_ACCESS_KEY_ID             = module.aws_iam.deployer_access_key
    AWS_SECRET_ACCESS_KEY         = module.aws_iam.deployer_secret_key
    AWS_REST_API_ID               = each.value.api_id
    AWS_REST_API_ROOT_RESOURCE_ID = each.value.root_resource_id
  }

  depends_on = [
    module.aws_serverless_api_{{ service_name }}
  ]
}
