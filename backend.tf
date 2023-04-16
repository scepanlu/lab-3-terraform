terraform {
  backend "remote" {
    organization = "ls-sdn"

    workspaces {
      name = "development"
    }

    workspaces {
      name = "production"
    }
  }
}
