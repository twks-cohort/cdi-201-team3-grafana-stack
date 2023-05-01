output "metrics_endpoint" {
  value     = grafana_cloud_stack.team_stack.prometheus_remote_write_endpoint
}

output "metrics_username" {
  value     = grafana_cloud_stack.team_stack.prometheus_user_id
}

output "logs_endpoint" {
  value     = grafana_cloud_stack.team_stack.logs_url
}

output "logs_username" {
  value     = grafana_cloud_stack.team_stack.logs_user_id
}

output "traces_endpoint" {
  value     = grafana_cloud_stack.team_stack.traces_url
}

output "traces_username" {
  value     = grafana_cloud_stack.team_stack.traces_user_id
}