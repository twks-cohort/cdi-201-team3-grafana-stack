terraform {
  required_version = "~> 1.2"
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 1.39"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "twks-cohort"
    workspaces {
      prefix = "cdi-201-team##-grafana-stack-"
    }
  }
}
