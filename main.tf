# Creazione di un infrastruttura docker dove alzo un container nginx

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
  # host = "unix:///var/run/docker.sock"
  host = var.DOCKER_SOCK
}

resource "docker_container" "nginx" {
  name  = "container-nginx"
  image = "nginx:latest"

  ports {
    internal = 80
    external = 8888
  }
}
