resource "vsphere_virtual_machine" "vm_okd" {
  count = var.instance_count
  name                 = format("${var.name}%02d", count.index+1)
  folder               = var.folder
  resource_pool_id     = var.resource_pool_id
  datastore_id         = data.vsphere_datastore.datastore.id

  num_cpus             = var.num_cpu
  memory               = var.memory
  guest_id             = data.vsphere_virtual_machine.template.guest_id
  
  
  enable_disk_uuid     = "true"
  wait_for_guest_net_timeout  = "0"
  wait_for_guest_net_routable = "false"

  network_interface {
    network_id = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
    use_static_mac = "true"
    mac_address = var.mac_addresses[count.index]
  }

  disk {
    label            = "disk0"
    size             = var.disk_size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  vapp {
    properties = {
      "guestinfo.ignition.config.data"          = base64encode(var.ignition),
      "guestinfo.ignition.config.data.encoding" = "base64"
    }
  }
}
