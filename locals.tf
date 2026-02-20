locals {
  web_vm_name = "${var.project_name}-${var.environment}-web"
  db_vm_name  = "${var.project_name}-${var.environment}-db"
  
  vm_names = {
    web = "${var.project_name}-${var.environment}-web"
    db  = "${var.project_name}-${var.environment}-db"
  }
  
  # Ресурсы ВМ
  vm_resources = {
    web = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
  
  # Общая metadata для всех ВМ
  vm_metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}