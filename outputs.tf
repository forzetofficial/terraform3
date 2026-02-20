output "web_vm" {
  description = "Web VM details"
  value = {
    instance_name = yandex_compute_instance.web.name
    external_ip   = yandex_compute_instance.web.network_interface.0.nat_ip_address
    fqdn          = yandex_compute_instance.web.fqdn
    zone          = yandex_compute_instance.web.zone
  }
}

output "db_vm" {
  description = "DB VM details"
  value = {
    instance_name = yandex_compute_instance.db.name
    external_ip   = yandex_compute_instance.db.network_interface.0.nat_ip_address
    fqdn          = yandex_compute_instance.db.fqdn
    zone          = yandex_compute_instance.db.zone
  }
}

output "all_vms" {
  description = "All VMs information"
  value = {
    web = {
      name        = yandex_compute_instance.web.name
      external_ip = yandex_compute_instance.web.network_interface.0.nat_ip_address
      fqdn        = yandex_compute_instance.web.fqdn
      zone        = yandex_compute_instance.web.zone
    }
    db = {
      name        = yandex_compute_instance.db.name
      external_ip = yandex_compute_instance.db.network_interface.0.nat_ip_address
      fqdn        = yandex_compute_instance.db.fqdn
      zone        = yandex_compute_instance.db.zone
    }
  }
}