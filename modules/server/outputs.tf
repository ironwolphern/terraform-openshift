output "mac_address" {
  value = vsphere_virtual_machine.vm_okd.*.name
}