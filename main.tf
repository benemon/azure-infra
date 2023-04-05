provider "azurerm" {
  features {}
}

locals {
  resource_tags = merge(var.extra_tags, { DoNotDelete = true })
}

resource "azurerm_resource_group" "compute" {
  name     = var.rg_name
  location = var.location

  tags = local.resource_tags
}

resource "azurerm_virtual_network" "compute" {
  name                = "${azurerm_resource_group.compute.name}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.compute.location
  resource_group_name = azurerm_resource_group.compute.name

  tags = local.resource_tags
}

resource "azurerm_subnet" "compute" {
  name                 = "${azurerm_resource_group.compute.name}-subnet"
  resource_group_name  = azurerm_resource_group.compute.name
  virtual_network_name = azurerm_virtual_network.compute.name
  address_prefixes     = ["10.0.2.0/24"]

}
