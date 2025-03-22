# Red Virtual
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet_gcs_cp2"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}

#Subred
resource "azurerm_subnet" "subnet" {
  name                 = "subnet_gcs_cp2"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

#Ip Publica
resource "azurerm_public_ip" "public_ip" {
  name                = "ippublica_gcs_cp2"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

#NIC VM
resource "azurerm_network_interface" "nic" {
  name                = "nic_gcs_cp2"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  ip_configuration {
    name                          = "ip_gcs_cp2"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.100"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}


