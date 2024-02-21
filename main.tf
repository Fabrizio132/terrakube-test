terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker" //Origine del provider che deriva da → registry.terraform.io/kreuzwerker/docker
      version = "~> 3.0.1"           //Vincolo di versione, se non impostato, ad ogni inizializzazione scarica il più recente che non potrebbe essere
      //più compatibile con la nostra configurazione
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false //Indica se deve mantenere localmente le immagini scaricate una volta distrutto il terraform main, se true allora li mantiene
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial" //Nome del container

  ports {
    internal = 80
    external = 8000
  }
}
