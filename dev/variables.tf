variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default     = "eastus"
}

variable "tenant_id" {
  description = "The Tenant ID where all resources will be deployed."
  sensitive = true
}

variable "environment" {
  description = "The name of the env."
  type        = string
  default     = "dev"
}

variable "project" {
  description = "The name of the project."
  type        = string
  default     = "zemter"
}


variable "tags" {
  type = map(string)
  description = "A map of tags to apply to resources provisioned"
  default = {
    "Owner"       = "pc acet",
    "Project"     = "zemter"
  }
}
variable "app_service_plan_sku" {
  description = "The SKU for the plan. Possible values include B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, I4v2, I5v2, I6v2, P1v2, P2v2, P3v2, P0v3, P1v3, P2v3, P3v3, P1mv3, P2mv3, P3mv3, P4mv3, P5mv3, S1, S2, S3, SHARED, EP1, EP2, EP3, FC1, WS1, WS2, WS3, and Y1."
  type        = string
  default     = "F1"
}

variable "user_object_ids" {
  type = list(string)
  default = [
    "test guid"
  ]
}
variable "app_services_list" {
  description = "A map of app service names."
  type = map(object({
    name             = string
    app_command_line = string
  }))
  default = {
    "alpha-web" = {
      name  = "alpha-web"
      app_command_line = "dotnet zemter.alpha.api.dll"
    }
    "beta-web" = {
      name  = "beta-web"
      app_command_line = "dotnet dotnet zemter.beta.api.dll"
    }
  }
}
