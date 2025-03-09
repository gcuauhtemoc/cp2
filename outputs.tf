#Grupo
output "resource_group_name" {
  description = "Nombre de grupo de recursos"
  value       = azurerm_resource_group.rg.name
}

#Ip publica
output "public_ip" {
  description = "Ip publica asignada a VM"
  value       = azurerm_public_ip.public_ip.ip_address
}

#Ip local
output "private_ip" {
  description = "Ip local asignada a VM"
  value       = azurerm_network_interface.nic.private_ip_address
}

#ACR
output "acr_login_server" {
  description = "Servidor de inicio de sesion ACR"
  value       = azurerm_container_registry.acr.login_server
}
