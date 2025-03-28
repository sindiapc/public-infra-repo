resource "azurerm_service_plan" "zembiec" {
  name                = "${var.project}-app-service-plan-${var.env}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            ="F1"
  os_type             = "Linux"

  tags = var.tags
}

