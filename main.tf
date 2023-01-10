# Creating the ResourceGroup

resource "azurerm_resource_group" "RGLab" {

    name        = var.RGName
    location    = var.AzureRegion

    tags = {
    environment = var.TagEnvironment
    usage       = var.TagUsage
    }
}

resource "azurerm_virtual_network" "RGLabVM" {
  name                = var.RGVMNET
  address_space       = [var.RGVMNETSPACE]
  location            = azurerm_resource_group.RGLab.location
  resource_group_name = azurerm_resource_group.RGLab.name
}

resource"azurerm_subnet" "RGLabSubnetVM"{
    name   = var.RGVMSUBNET
    resource_group_name = azurerm_resource_group.RGLab.name
    virtual_network_name    =   azurerm_virtual_network.RGLabVM.name
    address_prefixes    = [cidrsubnet(var.RGVMNETSPACE, 2, 1)]
}


resource "azurerm_network_security_group" "RGSecurityGroup" {
  name                = var.RGSecurityGroup
  location            = azurerm_resource_group.RGLab.location
  resource_group_name = azurerm_resource_group.RGLab.name
}

resource "azurerm_network_security_rule" "RGSecurity-InboudSSH" {
  name                        = "example-inbound-ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.RGLab.name
  network_security_group_name = azurerm_network_security_group.RGSecurityGroup.name
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.RGLabSubnetVM.id
  network_security_group_id = azurerm_network_security_group.RGSecurityGroup.id
}