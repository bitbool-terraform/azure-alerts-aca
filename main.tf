resource "azurerm_monitor_metric_alert" "cpu" {
  count = var.cpu_alert.enabled ? 1 : 0

  name                = "${var.name}-high-cpu"
  resource_group_name = var.resource_group

  scopes = [
    var.container_app_id
  ]

  target_resource_type     = "Microsoft.App/containerApps"
  target_resource_location = var.location

  severity    = var.cpu_alert.severity
  frequency   = var.cpu_alert.frequency
  window_size = var.cpu_alert.window_size
  enabled     = true

  criteria {
    metric_namespace = "Microsoft.App/containerApps"
    metric_name      = "CpuPercentage"
    aggregation      = var.cpu_alert.aggregation
    operator         = "GreaterThan"
    threshold        = var.cpu_alert.threshold
  }

  dynamic "action" {
    for_each = toset(var.action_group_ids)

    content {
      action_group_id = action.value
    }
  }

  tags = var.tags
}

resource "azurerm_monitor_metric_alert" "memory" {
  count = var.memory_alert.enabled ? 1 : 0

  name                = "${var.name}-high-memory"
  resource_group_name = var.resource_group

  scopes = [
    var.container_app_id
  ]

  target_resource_type     = "Microsoft.App/containerApps"
  target_resource_location = var.location

  severity    = var.memory_alert.severity
  frequency   = var.memory_alert.frequency
  window_size = var.memory_alert.window_size
  enabled     = true

  criteria {
    metric_namespace = "Microsoft.App/containerApps"
    metric_name      = "MemoryPercentage"
    aggregation      = var.memory_alert.aggregation
    operator         = "GreaterThan"
    threshold        = var.memory_alert.threshold
  }

  dynamic "action" {
    for_each = toset(var.action_group_ids)

    content {
      action_group_id = action.value
    }
  }

  tags = var.tags
}

resource "azurerm_monitor_metric_alert" "restart_count" {
  count = var.restart_count_alert.enabled ? 1 : 0

  name                = "${var.name}-restart-count"
  resource_group_name = var.resource_group

  scopes = [
    var.container_app_id
  ]

  target_resource_type     = "Microsoft.App/containerApps"
  target_resource_location = var.location

  severity    = var.restart_count_alert.severity
  frequency   = var.restart_count_alert.frequency
  window_size = var.restart_count_alert.window_size
  enabled     = true

  criteria {
    metric_namespace = "Microsoft.App/containerApps"
    metric_name      = "RestartCount"
    aggregation      = var.restart_count_alert.aggregation
    operator         = "GreaterThan"
    threshold        = var.restart_count_alert.threshold
  }

  dynamic "action" {
    for_each = toset(var.action_group_ids)

    content {
      action_group_id = action.value
    }
  }

  tags = var.tags
}

resource "azurerm_monitor_metric_alert" "response_time" {
  count = var.response_time_alert.enabled ? 1 : 0

  name                = "${var.name}-response-time"
  resource_group_name = var.resource_group

  scopes = [
    var.container_app_id
  ]

  target_resource_type     = "Microsoft.App/containerApps"
  target_resource_location = var.location

  severity    = var.response_time_alert.severity
  frequency   = var.response_time_alert.frequency
  window_size = var.response_time_alert.window_size
  enabled     = true

  criteria {
    metric_namespace = "Microsoft.App/containerApps"
    metric_name      = "ResponseTime"
    aggregation      = var.response_time_alert.aggregation
    operator         = "GreaterThan"
    threshold        = var.response_time_alert.threshold_ms
  }

  dynamic "action" {
    for_each = toset(var.action_group_ids)

    content {
      action_group_id = action.value
    }
  }

  tags = var.tags
}