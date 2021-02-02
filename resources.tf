module "folder" {
  source = "github.com/ironwolphern/terraform-folder"

  path          = upper(var.folder)
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

module "bootstrap" {
  source = "github.com/ironwolphern/terraform-server-oc-boot"

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

module "master" {
  source = "github.com/ironwolphern/terraform-server-oc"

  name             = "master"
  instance_count   = var.control_plane_count
  ignition         = var.control_plane_ignition
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  folder           = module.folder.path
  datastore        = var.vsphere_datastore
  network          = var.vm_network
  datacenter_id    = data.vsphere_datacenter.datacenter.id
  template         = var.vm_template
  mac_addresses    = var.control_plane_macs
  memory           = "16384"
  num_cpu          = "4"
  disk_size        = "120"
}

module "compute" {
  source = "github.com/ironwolphern/terraform-server-oc"

  name             = "worker"
  instance_count   = var.compute_count
  ignition         = var.compute_ignition
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  folder           = module.folder.path
  datastore        = var.vsphere_datastore
  network          = var.vm_network
  datacenter_id    = data.vsphere_datacenter.datacenter.id
  template         = var.vm_template
  mac_addresses    = var.compute_macs
  memory           = "16384"
  num_cpu          = "4"
  disk_size        = "120"
}