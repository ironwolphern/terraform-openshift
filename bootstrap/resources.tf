module "folder" {
  source = "../modules/folder"

  path          = upper(var.folder)
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

module "bootstrap" {
  source = "../modules/server"

  name             = "bootstrap"
  instance_count   = var.bootstrap_complete ? 0 : 1
  ignition         = var.bootstrap_ignition
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore        = var.vsphere_datastore
  folder           = module.folder.path
  network          = var.vm_network
  datacenter_id    = data.vsphere_datacenter.datacenter.id
  template         = var.vm_template
  mac_addresses    = compact(list(var.bootstrap_mac))
  memory           = "16384"
  num_cpu          = "4"
  disk_size        = "120"
}