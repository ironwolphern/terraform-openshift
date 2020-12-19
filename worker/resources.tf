module "compute" {
  source = "../modules/server"

  name             = "worker"
  instance_count   = var.compute_count
  ignition         = var.compute_ignition
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  folder           = data.vsphere_folder.folder.path
  datastore        = var.vsphere_datastore
  network          = var.vm_network
  datacenter_id    = data.vsphere_datacenter.datacenter.id
  template         = var.vm_template
  mac_addresses    = var.compute_macs
  memory           = "32768"
  num_cpu          = "8"
  disk_size        = "120"
}