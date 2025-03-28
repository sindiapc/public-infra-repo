# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0


variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "eastus"
}

variable "service_name" {
  description = "Name of the Service"
  type        = string
}
variable "app_service_plan_id" {
  description = "The App Service Plan to link with."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}
variable "tags" {
  type = map(string)
  description = "A map of tags to apply to resources provisioned"
}


variable "app_command_line" {
  description = "The App run command"
  type        = string
}
