resource "azurerm_monitor_metric_alert" "cpu" {
  count = var.alerts.cpu.enabled ? 1 : 0

  name                = "${var.name}-high-cpu"
  resource_group_name = var.resource_group

  scopes = [
    var.container_app_id
  ]

  target_resource_type     = "Microsoft.App/containerApps"
  target_resource_location = var.location

  severity    = var.alerts.cpu.severity
  frequency   = var.alerts.cpu.frequency
  window_size = var.alerts.cpu.window_size
  enabled     = true

  criteria {
    metric_namespace = "Microsoft.App/containerApps"
    metric_name      = "CpuPercentage"
    aggregation      = var.alerts.cpu.aggregation
    operator         = "GreaterThan"
    threshold        = var.alerts.cpu.threshold
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
  count = var.alerts.memory.enabled ? 1 : 0

  name                = "${var.name}-high-memory"
  resource_group_name = var.resource_group

  scopes = [
    var.container_app_id
  ]

  target_resource_type     = "Microsoft.App/containerApps"
  target_resource_location = var.location

  severity    = var.alerts.memory.severity
  frequency   = var.alerts.memory.frequency
  window_size = var.alerts.memory.window_size
  enabled     = true

  criteria {
    metric_namespace = "Microsoft.App/containerApps"
    metric_name      = "MemoryPercentage"
    aggregation      = var.alerts.memory.aggregation
    operator         = "GreaterThan"
    threshold        = var.alerts.memory.threshold
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
  count = var.alerts.restart_count.enabled ? 1 : 0

  name                = "${var.name}-restart-count"
  resource_group_name = var.resource_group

  scopes = [
    var.container_app_id
  ]

  target_resource_type     = "Microsoft.App/containerApps"
  target_resource_location = var.location

  severity    = var.alerts.restart_count.severity
  frequency   = var.alerts.restart_count.frequency
  window_size = var.alerts.restart_count.window_size
  enabled     = true

  criteria {
    metric_namespace = "Microsoft.App/containerApps"
    metric_name      = "RestartCount"
    aggregation      = var.alerts.restart_count.aggregation
    operator         = "GreaterThan"
    threshold        = var.alerts.restart_count.threshold
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
  count = var.alerts.response_time.enabled ? 1 : 0

  name                = "${var.name}-response-time"
  resource_group_name = var.resource_group

  scopes = [
    var.container_app_id
  ]

  target_resource_type     = "Microsoft.App/containerApps"
  target_resource_location = var.location

  severity    = var.alerts.response_time.severity
  frequency   = var.alerts.response_time.frequency
  window_size = var.alerts.response_time.window_size
  enabled     = true

  criteria {
    metric_namespace = "Microsoft.App/containerApps"
    metric_name      = "ResponseTime"
    aggregation      = var.alerts.response_time.aggregation
    operator         = "GreaterThan"
    threshold        = var.alerts.response_time.threshold_ms
  }

  dynamic "action" {
    for_each = toset(var.action_group_ids)

    content {
      action_group_id = action.value
    }
  }

  tags = var.tags
}