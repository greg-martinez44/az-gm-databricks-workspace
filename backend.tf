terraform {
  cloud {
    organization = "gm-practice-org"
    workspaces {
      project = "Azure"
      name    = "prod-workspace-01"
    }
  }
}
