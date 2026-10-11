resource "google_scc_v2_organization_notification_config" "scc_v2_organization_notification_configs" {
  for_each = var.scc_v2_organization_notification_configs

  config_id       = each.value.config_id
  organization    = each.value.organization
  pubsub_topic    = each.value.pubsub_topic
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  location        = each.value.location

  streaming_config {
    filter = each.value.streaming_config.filter
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

