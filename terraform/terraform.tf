terraform {
  cloud {
    organization = "rhall"
    hostname     = "app.terraform.io"

    workspaces {
      name = "fake-web-services-stack"
    }
  }
  required_providers {
    fakewebservices = {
      source  = "hashicorp/fakewebservices"
      version = "0.2.1"
    }
  }
}