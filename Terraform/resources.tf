# Creacion de ACR
resource "azurerm_container_registry" "acr" {
  name                = "acrgcscp2"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

# Creacion de VM
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm_gcs_cp2"
  computer_name       = "gcs-cp2"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_D1_v2"
  admin_username      = "adminuser"
# Asignacion de ip
  network_interface_ids = [azurerm_network_interface.nic.id]
# Disco
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
# Imagen SO
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-LTS"
    version   = "latest"
  }
# Deshabilitar autenticacion por contraseña
  disable_password_authentication = true
# Llave ssh
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("/root/.ssh/id_rsa.pub")
  }
}

# Creacion de AKS
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks_gcs_cp2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "dnsgcscp2"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}

