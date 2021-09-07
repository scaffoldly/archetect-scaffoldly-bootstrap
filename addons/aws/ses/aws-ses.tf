module "aws_ses" {
  source  = "scaffoldly/email/aws"
  version = "1.0.2"

  root_email = var.ROOT_EMAIL
  account_id = var.BOOTSTRAP_AWS_ACCOUNT_ID

  subdomain = "slyses"
  stages    = module.bootstrap_aws.stages

  providers = {
    aws.dns = aws.root
  }

  depends_on = [
    module.bootstrap_aws
  ]
}
