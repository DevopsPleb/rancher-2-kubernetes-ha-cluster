provider "vsphere" {
    user                        = var.vsphere-user
    password                    = var.vsphere-password
    vsphere_server              = var.vsphere-server
    allow_unverified_ssl        = true
}

# create etcd nodes
module "etcd" {
    source                  = "Terraform-VMWare-Modules/vm/vsphere"
    version                 = "3.4.0"
    vmname                  = "etcd"
    vmnameformat            = "%02"
    dc                      = var.dc
    vmrp                    = var.vmrp
    vmfolder                = var.vmfolder
    datastore               = var.datastore
    vmtemp                  = var.vmtemp
    instances               = var.instances
    cpu_number              = var.cpu_number
    ram_size                = var.ram_size
    vmname                  = var.vmname
    vmnameformat            = var.vmnameformat
    ipv4submask             = var.ipv4submask
    network                 = {
        "dpg-vc01-id17" = ["",""]
    }
    ipv4submask             = ["${var.ipv4submask}"]
    dns_server_list         = ["${var.dns_server_list}"]
}  

module "loadbalancer" {

    source                  = "Terraform-VMWare-Modules/vm/vsphere"
    version                 = "3.4.0"
    vmname                  = "loadbalancer"
    vmnameformat            = "%02"
    dc                      = var.dc
    vmrp                    = var.vmrp
    vmfolder                = var.vmfolder
    datastore               = var.datastore
    vmtemp                  = var.vmtemp
    instances               = 1
    cpu_number              = var.cpu_number
    ram_size                = var.ram_size
    vmname                  = var.vmname
    vmnameformat            = var.vmnameformat
    ipv4submask             = var.ipv4submask
    network                 = {
        "dpg-vc01-id17" = [""]
    }
    ipv4submask             = ["${var.ipv4submask}"]
    dns_server_list         = ["${var.dns_server_list}"]
}

module "controlplane" {

    source                  = "Terraform-VMWare-Modules/vm/vsphere"
    version                 = "3.4.0"
    vmname                  = "controlplane"
    vmnameformat            = "%02"
    dc                      = var.dc
    vmrp                    = var.vmrp
    vmfolder                = var.vmfolder
    datastore               = var.datastore
    vmtemp                  = var.vmtemp
    instances               = var.instances
    cpu_number              = var.cpu_number
    ram_size                = var.ram_size
    vmname                  = var.vmname
    vmnameformat            = var.vmnameformat
    ipv4submask             = var.ipv4submask
    network                 = {
        "dpg-vc01-id17" = ["",""]
    }
    ipv4submask             = ["${var.ipv4submask}"]
    dns_server_list         = ["${var.dns_server_list}"]
}

module "worker" {

    source                  = "Terraform-VMWare-Modules/vm/vsphere"
    version                 = "3.4.0"
    vmname                  = "loadbalancer"
    vmnameformat            = "%02"
    dc                      = var.dc
    vmrp                    = var.vmrp
    vmfolder                = var.vmfolder
    datastore               = var.datastore
    vmtemp                  = var.vmtemp
    instances               = var.instances
    cpu_number              = var.cpu_number
    ram_size                = var.ram_size
    vmname                  = var.vmname
    vmnameformat            = var.vmnameformat
    ipv4submask             = var.ipv4submask
    network                 = {
        "dpg-vc01-id17" = ["",""]
    }
    ipv4submask             = ["${var.ipv4submask}"]
    dns_server_list         = ["${var.dns_server_list}"]
}

