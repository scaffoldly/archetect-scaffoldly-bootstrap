## THIS FILE IS AUTOMATICALLY GENERATED BY SCAFFOLDLY    ##
## CONFIG CAN BE CHANGED HERE: https://start.scaffold.ly ##

module "aws_serverless_api_{{ service_name }}" {
  source  = "scaffoldly/serverless-api/aws"
  version = "1.0.3"

  repository_name    = "{{ repository-name }}"
  api_gateway_stages = module.bootstrap_aws.api_gateway_stages
  path               = "{{ path }}"

  depends_on = [
    module.bootstrap_aws
  ]
}
