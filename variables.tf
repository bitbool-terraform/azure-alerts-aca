variable "name" {
  type = string
}

variable "resource_group" {
  type = string
}
variable "location" {
  type = string
}

variable "container_app_id" {
  type = string
}

variable "action_group_ids" {
  type    = list(string)
  default = []

validation {
    condition     = length(var.action_group_ids) > 0
    error_message = "At least one action group id needed."
  }
}

variable "alerts" {
  description = "Container App metric alert settings."
  type = object({
    cpu = optional(object({
      enabled     = optional(bool, true)
      threshold   = optional(number, 80)
      aggregation = optional(string, "Average")
      severity    = optional(number, 2)
      frequency   = optional(string, "PT1M")
      window_size = optional(string, "PT5M")
    }), {})

    memory = optional(object({
      enabled     = optional(bool, true)
      threshold   = optional(number, 80)
      aggregation = optional(string, "Average")
      severity    = optional(number, 2)
      frequency   = optional(string, "PT1M")
      window_size = optional(string, "PT5M")
    }), {})

    restart_count = optional(object({
      enabled     = optional(bool, true)
      threshold   = optional(number, 3)
      aggregation = optional(string, "Maximum")
      severity    = optional(number, 1)
      frequency   = optional(string, "PT1M")
      window_size = optional(string, "PT5M")
    }), {})

    response_time = optional(object({
      enabled      = optional(bool, true)
      threshold_ms = optional(number, 2000)
      aggregation  = optional(string, "Average")
      severity     = optional(number, 2)
      frequency    = optional(string, "PT1M")
      window_size  = optional(string, "PT5M")
    }), {})
  })

  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}