terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "2.11.0"
    }
  }
}

provider "grafana" {
  alias         = "cloud"
  cloud_api_key = "my-token"
}

resource "grafana_cloud_stack" "my_stack" {
  provider = grafana.cloud

  name        = "myteststack"
  slug        = "myteststack"
  region_slug = "us"
}
