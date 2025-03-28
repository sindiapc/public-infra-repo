output "resource_group_name" {  
  value       = azurerm_resource_group.backend-rg.name  
  description = "The name of the resource group created for the backend."  
}  
  

output "app_service_plan_name" {  
  value       = module.app_service_plan.name  
  description = "The name of the App Service Plan created by the module."  
}  