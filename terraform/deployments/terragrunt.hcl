locals {
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
  default_account_id = get_env(
    "AWS_DEFAULT_ACCOUNT_ID",
    try(
      run_cmd(
        "--terragrunt-quiet",
        "aws",
        "sts",
        "get-caller-identity",
        "--query",
        "\"Account\"",
        "--output",
        "text"
      ),
    "")
  )
  region = get_env("AWS_REGION", local.default_region)
  account_id = get_env("AWS_ACCOUNT_ID", local.default_account_id)
  bucket_name = "terraform-${local.default_account_id}"
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
  default_region = local.default_region
  default_account_id = local.default_account_id
  region = local.region
  account_id = local.account_id
  bucket_name = local.bucket_name
}
