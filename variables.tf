variable "group_name" {
  description = "The name of the instance group to create"
  type        = string
}

variable "target_size" {
  description = "The desired number of instances in the instance group"
  type        = number
  default     = 1
}

variable "version_name" {
  description = "The name of the version to be created"
  type        = string
}

variable "template_id" {
  description = "The ID of the instance template to use for the instance group"
  type        = string
}

variable "zone" {
  description = "The zone in which to create the resources"
  type        = string
  default     = "us-central1-a"
}

variable "min_replicas" {
  description = "The minimum number of replicas to maintain for the instance group"
  type        = number
  default     = 1
}

variable "max_replicas" {
  description = "The maximum number of replicas to allow for the instance group"
  type        = number
  default     = 1
}

variable "named_port" {
  description = "The port number to expose on the instances in the instance group"
  type        = number
  default     = 80
}

variable "target_load_balancing_utilization" {
  type    = number
  default = 0.9
}

variable "target_cpu_utilization" {
  type    = number
  default = 0.9
}

variable "cooldown_period" {
  type    = number
  default = 150
}
