
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

data "vsphere_virtual_machine" "c1_template" {
  name          = "${var.c1_template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_virtual_machine" "c2_template" {
  name          = "${var.c2_template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_virtual_machine" "c3_template" {
  name          = "${var.c3_template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_virtual_machine" "c4_template" {
  name          = "${var.c4_template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_host" "host" {
  name          = "${var.vsphere_host}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "c1_vms" {
  count 		= "${var.num_of_c1}"
  name             	= "${var.c1_name_prefix}${count.index}"
  resource_pool_id 	= "${data.vsphere_resource_pool.pool.id}"
  datastore_id     	= "${data.vsphere_datastore.datastore.id}"
  host_system_id	= "${data.vsphere_host.host.id}"

  num_cpus 	= "${var.c1_cpu}"
  memory   	= "${var.c1_ram}"
  guest_id 	= "${data.vsphere_virtual_machine.c1_template.guest_id}"
  scsi_type 	= "${data.vsphere_virtual_machine.c1_template.scsi_type}"
  
  network_interface {
    network_id   	= "${data.vsphere_network.network.id}"
    adapter_type 	= "vmxnet3"
  }

  disk {
    label 		= "disk0"
    size		= "${var.c1_disk_size}"
    thin_provisioned 	= "false"
  }
  
  clone {
    template_uuid = "${data.vsphere_virtual_machine.c1_template.id}"

    customize {
      linux_options {
        
		host_name = "${format("%s%03d", var.c1_name_prefix, count.index + 1)}"
		domain    = "$(var.vm_domain_name)"
      }
      network_interface {
        ipv4_address    = "${cidrhost(var.vm_network_address, var.vm_ip_address_start + count.index)}"
        ipv4_netmask    = 22
      }
	  ipv4_gateway = "${var.vm_gateway}"
	  dns_server_list = ["8.8.8.8","1.1.1.1"] 
    }		
  }
}

resource "vsphere_virtual_machine" "c2_vms" {
  count                 = "${var.num_of_c2}"
  name                  = "${var.c2_name_prefix}${count.index}"
  resource_pool_id      = "${data.vsphere_resource_pool.pool.id}"
  datastore_id          = "${data.vsphere_datastore.datastore.id}"
  host_system_id        = "${data.vsphere_host.host.id}"

  num_cpus      = "${var.c2_cpu}"
  memory        = "${var.c2_ram}"
  guest_id      = "${data.vsphere_virtual_machine.c2_template.guest_id}"
  scsi_type     = "${data.vsphere_virtual_machine.c2_template.scsi_type}"

  network_interface {
    network_id          = "${data.vsphere_network.network.id}"
    adapter_type        = "vmxnet3"
  }

  disk {
    label               = "disk0"
    size                = "${var.c2_disk_size}"
    thin_provisioned    = "false"
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.c2_template.id}"

    customize {
      linux_options {

                host_name = "${format("%s%03d", var.c2_name_prefix, count.index + 1)}"
                domain    = "$(var.vm_domain_name)"
      }
      network_interface {
        ipv4_address    = "${cidrhost(var.vm_network_address, var.vm_ip_address_start + count.index + var.num_of_c1)}"
        ipv4_netmask    = 22
      }
          ipv4_gateway = "${var.vm_gateway}"
          dns_server_list = ["8.8.8.8","1.1.1.1"]
    }
  }
}

resource "vsphere_virtual_machine" "c3_vms" {
  count                 = "${var.num_of_c3}"
  name                  = "${var.c3_name_prefix}${count.index}"
  resource_pool_id      = "${data.vsphere_resource_pool.pool.id}"
  datastore_id          = "${data.vsphere_datastore.datastore.id}"
  host_system_id        = "${data.vsphere_host.host.id}"

  num_cpus      = "${var.c3_cpu}"
  memory        = "${var.c3_ram}"
  guest_id      = "${data.vsphere_virtual_machine.c3_template.guest_id}"
  scsi_type     = "${data.vsphere_virtual_machine.c3_template.scsi_type}"

  network_interface {
    network_id          = "${data.vsphere_network.network.id}"
    adapter_type        = "vmxnet3"
  }

  disk {
    label               = "disk0"
    size                = "${var.c3_disk_size}"
    thin_provisioned    = "false"
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.c3_template.id}"

    customize {
      linux_options {

                host_name = "${format("%s%03d", var.c3_name_prefix, count.index + 1)}"
                domain    = "$(var.vm_domain_name)"
      }
      network_interface {
        ipv4_address    = "${cidrhost(var.vm_network_address, var.vm_ip_address_start + count.index + var.num_of_c1 + var.num_of_c2)}"
        ipv4_netmask    = 22
      }
          ipv4_gateway = "${var.vm_gateway}"
          dns_server_list = ["8.8.8.8","1.1.1.1"]
    }
  }
}

resource "vsphere_virtual_machine" "c4_vms" {
  count                 = "${var.num_of_c4}"
  name                  = "${var.c4_name_prefix}${count.index}"
  resource_pool_id      = "${data.vsphere_resource_pool.pool.id}"
  datastore_id          = "${data.vsphere_datastore.datastore.id}"
  host_system_id        = "${data.vsphere_host.host.id}"

  num_cpus      = "${var.c4_cpu}"
  memory        = "${var.c4_ram}"
  guest_id      = "${data.vsphere_virtual_machine.c2_template.guest_id}"
  scsi_type     = "${data.vsphere_virtual_machine.c2_template.scsi_type}"

  network_interface {
    network_id          = "${data.vsphere_network.network.id}"
    adapter_type        = "vmxnet3"
  }

  disk {
    label               = "disk0"
    size                = "${var.c4_disk_size}"
    thin_provisioned    = "false"
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.c4_template.id}"

    customize {
      linux_options {

                host_name = "${format("%s%03d", var.c4_name_prefix, count.index + 1)}"
                domain    = "$(var.vm_domain_name)"
      }
      network_interface {
        ipv4_address    = "${cidrhost(var.vm_network_address, var.vm_ip_address_start + count.index + var.num_of_c1 + var.num_of_c2 + var.num_of_c3)}"
        ipv4_netmask    = 22
      }
          ipv4_gateway = "${var.vm_gateway}"
          dns_server_list = ["8.8.8.8","1.1.1.1"]
    }
  }
}

