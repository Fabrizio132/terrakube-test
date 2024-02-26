# Creazione di un infrastruttura docker dove alzo un container nginx

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
  host = "tcp://localhost:2375"
}

resource "docker_container" "nginx" {
  name  = "container-nginx"
  image = "nginx:latest"

  ports {
    internal = 80
    external = 8888
  }
}
