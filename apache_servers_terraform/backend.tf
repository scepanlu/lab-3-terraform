terraform {
  backend "remote" {
    organization = "fc-terra"
    workspaces {
      name = "project0"
    }
  }
}
