variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_server" {}

variable "vsphere_dc" {}
variable "vsphere_ds1" {}
variable "vsphere_rp" {}

variable "num_of_vms" {
  type = "string"
}

variable "vm_name_prefix" {
  type = "string"
}

variable "vm_template" {
  type = "string"
}

variable "vm_network" {
  type = "string"
}


variable "vm_network_address" {
  type = "string"
}

variable "vm_ip_address_start" {
  default = "<INTEGER>"
}

variable "vm_gateway" {
  type = "string"
}

variable "disk_size" {
  type = "string"
}

variable "vm_dns_servers" {
  type = "string"
}

variable "vm_domain_name" {
  description = "The domain of the virtual machine"
  default     = "<STRING>"
}