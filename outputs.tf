output "cpu_alert_id" {
  value = try(azurerm_monitor_metric_alert.cpu[0].id, null)
}

output "memory_alert_id" {
  value = try(azurerm_monitor_metric_alert.memory[0].id, null)
}

output "restart_count_alert_id" {
  value = try(azurerm_monitor_metric_alert.restart_count[0].id, null)
}

output "response_time_alert_id" {
  value = try(azurerm_monitor_metric_alert.response_time[0].id, null)
}