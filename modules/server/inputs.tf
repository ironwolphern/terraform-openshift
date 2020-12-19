variable "name" {
  type = string
}

variable "instance_count" {
  type = number
  default = 0
}

variable "ignition" {
  type    = string
  default = ""
}

variable "resource_pool_id" {
  type = string
}

variable "folder" {
  type = string
}

variable "datastore" {
  type = string
}

variable "network" {
  type = string
}

variable "datacenter_id" {
  type = string
}

variable "template" {
  type = string
}

variable "mac_addresses" {
  type = list
}
variable "memory" {
  type = string
}

variable "num_cpu" {
  type = string
}

variable "disk_size" {
  type = string
}