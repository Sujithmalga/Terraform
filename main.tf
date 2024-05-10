resource "azurerm_resource_group" "group" {
    name = "networking"
    location = "eastus"
}
resource "azurerm_virtual_network" "networking" {
    location = azurerm_resource_group.group.location
    name = azurerm_resource_group.group.name
    resource_group_name = azurerm_resource_group.group.name
    address_space = ["192.168.0.0/16"]
    
    subnet = {
        name = "subnet1"
        address_space = "192.168.0.0/24"
    }
    subnet = {
        name = "subnet2"
        address_space = "192.168.1.0/24"
    }
    depends_on = [ azurerm_resource_group.group ]

}