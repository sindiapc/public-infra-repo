

data "terraform_remote_state" "terraform_remote_state" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sindiainfrastate"
    container_name       = "tfstate-${var.environment}"
    key                  = "terraform/${var.environment}/terraform.tfstate"
    environment          = "public"
  }
}


resource "azurerm_resource_group" "backend-rg" {
  name     = "${var.project}-${var.environment}-backend-rg"
  location = var.location
}

module "app_service_plan" {
  source              = "../modules/app-service-plan"
  resource_group_name = azurerm_resource_group.backend-rg.name
  env                 = "${var.environment}"
  sku                 = var.app_service_plan_sku
  tags = merge(  
    var.tags,  
    { "Environment" = var.environment }  
  ) 
}
module "appservices" {
  for_each                             = var.app_services_list

  source                               = "../modules/app-service"
  service_name                         = "${each.value.name}-${var.environment}-${var.project}"
  app_service_plan_id                  = module.app_service_plan.app_service_plan_id
  location                             = var.location
  resource_group_name                  = azurerm_resource_group.backend-rg.name
  # storage_account_key                  = module.storage.backend_storage_account_key
  app_command_line                     = each.value.app_command_line
 
  tags = merge(  
    var.tags,  
    { "Environment" = var.environment }  
  ) 
}








