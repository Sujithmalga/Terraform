resource "azurerm_resource_group" "vm" {
  name     = "vm"
  location = "east-us"
}

resource "azurerm_virtual_network" "example" {
  name                = "network"
  address_space       = [var.primary.default]
  location            = azurerm_resource_group.vm.location
  resource_group_name = azurerm_resource_group.vm.name
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.vm.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.subnet1.default]
}
resource "azurerm_subnet" "subnet2" {
  name                 = "external"
  resource_group_name  = azurerm_resource_group.vm.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.subnet2.default]
  
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.vm.location
  resource_group_name = azurerm_resource_group.vm.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = var.virtual_machine.name
  resource_group_name = azurerm_resource_group.vm.name
  location            = azurerm_resource_group.vm.location
  size                = var.virtual_machine.size
  admin_username      = var.virtual_machine.admin_username
  network_interface_ids = [
    azurerm_network_interface.example.id]

  admin_ssh_key {
    username   = var.sshfile
    public_key = file(var.sshfile.public_key)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}