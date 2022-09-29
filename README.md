# terraform-newrelic-alerts

## Usage APM module

```terraform
provider "newrelic" {
  account_id    = "32467XX"
  api_key       = "NRAK-xxx"
  region        = "US"
}

resource "newrelic_alert_channel" "pagerduty_ui" {
  name = "PagerDuty ui"
  type = "pagerduty"

  config {
    service_key = "xxx"
  }
}

resource "newrelic_alert_channel" "pagerduty_apiservice" {
  name = "PagerDuty apiervice"
  type = "pagerduty"

  config {
    service_key = "xxx"
  }
}

module "newrelic_alerts_service_ui" {
  source      = "github.com/sivakumarvunnam/terraform-newrelic-alerts"
  environment = "production"
  policy_name = "APM anomalies detected (ui)"

  alert_channel_ids = [newrelic_alert_channel.pagerduty_ui.id]

  app_apdex_score_threshold_duration_critical = 300
  app_apdex_score_threshold_critical          = 0.85
}

module "newrelic_alerts_service_apiservice" {
  source      = "github.com/sivakumarvunnam/terraform-newrelic-alerts"
  environment = "production"
  policy_name = "APM anomalies detected (apiservice)"

  alert_channel_ids = [newrelic_alert_channel.pagerduty_apiservice.id]

  app_apdex_score_threshold_duration_critical = 600
  app_apdex_score_threshold_critical          = 0.7
}
```
