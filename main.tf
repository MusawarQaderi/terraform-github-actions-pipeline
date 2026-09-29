terraform {
  required_version = ">= 1.0.0"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  # Verbindet sich automatisch mit dem Docker-Daemon
}

# Ein einfacher Test-Container (Nginx Webserver)
resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = false
}

resource "docker_container" "mein_webserver" {
  image = docker_image.nginx.image_id
  name  = "mein-cooler-container"
  ports {
    internal = 80
    external = 8080
  }
}
