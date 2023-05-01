#!/usr/bin/env bats

@test "Ensure grafana stack $TENANT" {
  run bash -c 'curl -L -H "Authorization: Bearer $GRAFANA_CLOUD_API_KEY" https://grafana.com/api/orgs/seanalvarez/instances'
  [[ "${output}" =~ '"name": "team0-201-stack"' ]]
}

@test "evaluate grafana cloud tenant $TENANT" {
  run bash -c 'curl -L -H "Authorization: Bearer $API_KEY" https://team0201stack.grafana.net/api/datasources'
  [[ "${output}" =~ "prometheus" ]]
}