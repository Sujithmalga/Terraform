variable "primary" {
    type = list(string)
    description = " create vnet"
    default = [ "192.162.0.0/16" ]   
}
variable "subnet1" {
    type = string
    description = " create vnet"
    default = "192.162.0.0/24"    
}
variable "subnet2" {
    type = string
    description = " create subnet2"
    default =  "192.162.1.0/24"    
}

variable "virtual_machine" {
    type = list(object)
    default = [
         size                = "Standard_F2"
         admin_username      = "adminuser"
         name                = "example-machine"]
    description = " create virtual machine"  
}
 variable "sshfile" {
    type = list(object)
    description = " create sshfile"
    default = [
         username   = "adminuser"
         public_key = file("~/.ssh/id_rsa.pub")
    ]   
}
   


