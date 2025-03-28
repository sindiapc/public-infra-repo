resource "azurerm_service_plan" "zemter_plan" {
  name                = "${var.project}-service-plan-${var.env}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            =var.sku
  os_type             = "Linux" 

  tags = var.tags
}
