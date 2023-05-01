#!/usr/bin/env bash
export ENVIRONMENT=$1
terraform init
terraform workspace select ${ENVIRONMENT}
terraform output -raw service_account_token_management_key | opw write team0-201-svc-grafana ${ENVIRONMENT}_management_sa_key -