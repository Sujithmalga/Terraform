variable "primary" {
  type        = list(string)
  description = "Create VNet address space"
  default     = ["192.168.0.0/16"]
}

variable "subnet1" {
  type        = string
  description = "Create subnet1 address prefix"
  default     = "192.168.0.0/24"
}

variable "subnet2" {
  type        = string
  description = "Create subnet2 address prefix"
  default     = "192.168.1.0/24"
}

variable "virtual_machine" {
  type = object({
    size           = string
    admin_username = string
    name           = string
  })
  default = {
    size           = "Standard_F2"
    admin_username = "adminuser"
    name           = "example-machine"
  }
  description = "Create virtual machine configuration"
}

variable "sshfile" {
  type = object({
    public_key = string
  })
  description = "SSH public key for the virtual machine"
}

variable "publicip" {
  type = object({
    name              = string
    allocation_method = string
  })
  description = "Create public ip configuration"
}


