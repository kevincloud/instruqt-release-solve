variable "project_key" {}

provider "launchdarkly" {}

resource "launchdarkly_feature_flag" "release_storefront_flag" {
  project_key = var.project_key
  key         = "storeEnabled"
  name        = "Release Toggle Outfitters Updated Storefront"

  variation_type = "boolean"

  variations {
    value = "true"
    name  = "Store Enabled"
  }
  variations {
    value = "false"
    name  = "Store Disabled"
  }

  client_side_availability {
    using_environment_id = true
    using_mobile_key     = false
  }

  defaults {
    on_variation  = 0
    off_variation = 1
  }
}
