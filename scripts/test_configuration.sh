#!/usr/bin/env bash
export ENVIRONMENT=$1
terraform init
terraform workspace select ${ENVIRONMENT}
export API_KEY=$(terraform output -raw service_account_token_management_key)

bats test/validate_glc.bats

