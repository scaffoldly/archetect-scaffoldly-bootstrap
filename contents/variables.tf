variable "ROOT_EMAIL" {
  type        = string
  description = "Root email address"
}

variable "BOOTSTRAP_AWS_ACCOUNT_ID" {
  type        = string
  description = "AWS Account ID in which to create resources"
}

variable "BOOTSTRAP_GITHUB_TOKEN" {
  type        = string
  description = "GitHub Token"
}

variable "BOOTSTRAP_ORGANIZATION" {
  type        = string
  description = "GitHub/Terraform Cloud Organization"
}
