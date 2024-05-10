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


