variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_server" {}

variable "vsphere_dc" {}
variable "vsphere_ds1" {}
variable "vsphere_rp" {}
variable "vsphere_host" {}

variable "num_of_vms" {
  type = "string"
}
variable "num_of_c1" {
  type = "string"
}
variable "num_of_c2" {
  type = "string"
}
variable "num_of_c3" {
  type = "string"
}
variable "num_of_c4" {
  type = "string"
}


variable "vm_name_prefix" {
  type = "string"
}
variable "vm_template" {
  type = "string"
}
variable "c1_name_prefix" {
  type = "string"
}
variable "c1_template" {
  type = "string"
}
variable "c2_name_prefix" {
  type = "string"
}
variable "c2_template" {
  type = "string"
}
variable "c3_name_prefix" {
  type = "string"
}
variable "c3_template" {
  type = "string"
}
variable "c4_name_prefix" {
  type = "string"
}
variable "c4_template" {
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
variable "c1_ip_address_start" {
  default = "<INTEGER>"
}
variable "c2_ip_address_start" {
  default = "<INTEGER>"
}
variable "c3_ip_address_start" {
  default = "<INTEGER>"
}
variable "c4_ip_address_start" {
  default = "<INTEGER>"
}

variable "vm_gateway" {
  type = "string"
}
variable "vm_dns_servers" {
  type = "string"
}
variable "vm_domain_name" {
  description = "The domain of the virtual machine"
  default     = "<STRING>"
}

variable "c1_cpu" {
  type = "string"
}
variable "c2_cpu" {
  type = "string"
}
variable "c3_cpu" {
  type = "string"
}
variable "c4_cpu" {
  type = "string"
}

variable "c1_ram" {
  type = "string"
}
variable "c2_ram" {
  type = "string"
}
variable "c3_ram" {
  type = "string"
}
variable "c4_ram" {
  type = "string"
}

variable "c1_disk_size" {
  type = "string"
}
variable "c2_disk_size" {
  type = "string"
}
variable "c3_disk_size" {
  type = "string"
}
variable "c4_disk_size" {
  type = "string"
}

