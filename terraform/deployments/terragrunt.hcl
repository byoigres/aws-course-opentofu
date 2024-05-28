locals {
  path = path_relative_to_include()
  default_region = get_env(
    "AWS_DEFAULT_REGION",
    try(
      run_cmd(
        "--terragrunt-quiet",
        "aws",
        "configure",
        "get",
        "region"
      ),
    "")
  )
  default_environment = split("/", local.path)[0]
  environment = get_env(
    "ENVIRONMENT",
    local.default_environment
  )
  stage = get_env(
    "STAGE",
    local.environment
  )
  region = get_env("AWS_REGION", local.default_region)
  account_id = get_env("ACCOUNT_ID", get_aws_account_id())
  bucket_name = "terraform-${local.account_id}"
}

remote_state {
  backend = "s3"

  generate = {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    bucket = local.bucket_name
    key = "${path_relative_to_include()}/terraform.tfstate"
    region = local.region
    encrypt = false
    dynamodb_table = "terraform-lock-states"
    disable_bucket_update = true
  }
}

inputs = {
  environment = local.environment
  stage = local.stage
  region = local.region
  account_id = local.account_id
  bucket_name = local.bucket_name
  tags = {
    Terraform = true
    Region = local.region
    Environment = local.environment
    Stage = local.stage
    DeploymentDirectory = local.path
  }
}
