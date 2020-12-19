// Name of the folder on Vsphere server.
folder = ""

// Name of the vSphere server. The dev cluster is on "vcsa.vmware.devcluster.openshift.com".
vsphere_server = ""

// User on the vSphere server.
vsphere_user = ""

// Password of the user on the vSphere server.
vsphere_password = ""

// Name of the vSphere cluster. The dev cluster is "devel".
vsphere_cluster = ""

// Name of the vSphere data center. The dev cluster is "dc1".
vsphere_datacenter = ""

// Name of the vSphere data store to use for the VMs. The dev cluster uses "nvme-ds1".
vsphere_datastore = ""

// Name of the VM template to clone to create VMs for the cluster. The dev cluster has a template named "rhcos-latest".
vm_template = "fcos_template"

// his is the name of the publicly accessible network for cluster ingress and access.
vm_network = ""

// Ignition config for the bootstrap machine. You should change the source, based on your environment.
bootstrap_ignition = <<END_OF_BOOTSTRAP_IGNITION
{"ignition":{"config":{"merge":[{"source":"http://bootstrap.ign","verification":{}}],"replace":{"source":null,"verification":{}}},"security":{"tls":{}},"timeouts":{},"version":"3.0.0"},"passwd":{},"storage":{},"systemd":{}}
END_OF_BOOTSTRAP_IGNITION

// The MAC address to assign to the bootstrap VM.
bootstrap_mac = ""