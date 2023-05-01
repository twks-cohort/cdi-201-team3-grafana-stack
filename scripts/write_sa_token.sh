#!/usr/bin/env bash
export ENVIRONMENT=$1

export STACK_SLUG=$(cat ${ENVIRONMENT}.auto.tfvars.json | jq -r .stack_slug)

terraform init
terraform workspace select ${ENVIRONMENT}
terraform output -raw service_account_token_management_key | opw write team0-201-svc-grafana ${STACK_SLUG}_management_sa_key -