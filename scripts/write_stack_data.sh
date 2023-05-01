#!/usr/bin/env bash
export ENVIRONMENT=$1

export STACK_SLUG=$(cat ${ENVIRONMENT}.auto.tfvars.json | jq -r .stack_slug)

terraform init
terraform workspace select ${ENVIRONMENT}
terraform output -raw service_account_token_management_key | opw write team0-201-svc-grafana ${STACK_SLUG}_management_sa_key -
terraform output -raw metrics_endpoint | opw write team0-201-svc-grafana ${STACK_SLUG}_metrics_endpoint -
terraform output -raw metrics_username | opw write team0-201-svc-grafana ${STACK_SLUG}_metrics_username -
echo "$(terraform output -raw logs_endpoint)/loki/api/v1/push" | opw write team0-201-svc-grafana ${STACK_SLUG}_logs_endpoint -
terraform output -raw logs_username | opw write team0-201-svc-grafana ${STACK_SLUG}_logs_username -
terraform output -raw traces_endpoint | opw write team0-201-svc-grafana ${STACK_SLUG}_traces_endpoint -
terraform output -raw traces_username | opw write team0-201-svc-grafana ${STACK_SLUG}_traces_username -