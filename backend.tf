terraform {
  cloud {
    organization = "gm-practice-org"
    workspaces {
      project = "Azure"
      name    = "prod-dbw-databricks-westus2-001"
    }
  }
}
