output "app_service" {
  value = {
    app_id = azurerm_linux_web_app.zemter-web.id
    app_host = azurerm_linux_web_app.zemter-web.default_hostname
    app_name = regex("^([^.]+)", azurerm_linux_web_app.zemter-web.default_hostname)[0]
    
  }
}

output "principal_ids" {
  value = [azurerm_linux_web_app.zemter-web.identity[0].principal_id]
  #value = [for app in azurerm_linux_web_app.zembiec : app.identity[0].pricipal_id]
  #sensitive = true
 }