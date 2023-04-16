terraform {
  backend "remote" {
    organization = "ls-terra"

    workspaces {
      name = "development"
    }

    workspaces {
      name = "production"
    }
  }
}
