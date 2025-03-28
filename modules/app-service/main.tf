resource "azurerm_linux_web_app" "zemter_web" {
  name                = var.service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.app_service_plan_id

  site_config {
    always_on = false
    ftps_state = "FtpsOnly"
    http2_enabled = true
    app_command_line = var.app_command_line

    application_stack {
      dotnet_version = "8.0"
    }
  }


  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}




