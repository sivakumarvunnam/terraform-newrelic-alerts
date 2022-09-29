terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "3.3.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "newrelic" {
  account_id = ""
  api_key = ""
  region = "US"
}
