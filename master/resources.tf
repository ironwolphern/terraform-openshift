module "master" {
  source = "../modules/server"

  name             = "master"
  instance_count   = var.control_plane_count
  ignition         = var.control_plane_ignition
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  folder           = data.vsphere_folder.folder.path
  datastore        = var.vsphere_datastore
  network          = var.vm_network
  datacenter_id    = data.vsphere_datacenter.datacenter.id
  template         = var.vm_template
  mac_addresses    = var.control_plane_macs
  memory           = "16384"
  num_cpu          = "4"
  disk_size        = "120"
}