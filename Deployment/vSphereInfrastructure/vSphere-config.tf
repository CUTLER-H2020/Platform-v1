
provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"
  
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_dc}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_ds1}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_rp}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vm_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.vm_template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  count 			= "${var.num_of_vms}"
  name             	= "${var.vm_name_prefix}${count.index}"
  resource_pool_id 	= "${data.vsphere_resource_pool.pool.id}"
  datastore_id     	= "${data.vsphere_datastore.datastore.id}"

  num_cpus = 4
  memory   = 8192
  guest_id 	= "${data.vsphere_virtual_machine.template.guest_id}"
  
  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   	= "${data.vsphere_network.network.id}"
    adapter_type 	= "vmxnet3"
  }

  disk {
    label 				= "disk0"
    size				= "${var.disk_size}"
    thin_provisioned 	= "true"
  }
  
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        
		host_name = "${format("%s%03d", var.vm_name_prefix, count.index + 1)}"
		domain    = "$(var.vm_domain_name)"
      }

      network_interface {
        ipv4_address    = "${cidrhost(var.vm_network_address, var.vm_ip_address_start + count.index)}"
        ipv4_netmask    = 24
      }
	  ipv4_gateway = "${var.vm_gateway}"
	  dns_server_list = ["${split(",", var.vm_dns_servers)}"]
      
    }
		
  }
  
}