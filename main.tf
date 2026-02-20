resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

# Подсеть для зоны A (web)
resource "yandex_vpc_subnet" "subnet_a" {
  name           = "${var.vpc_name}-subnet-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.10.0/24"]
}

# Подсеть для зоны B (db)
resource "yandex_vpc_subnet" "subnet_b" {
  name           = "${var.vpc_name}-subnet-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.20.0/24"]
}

data "yandex_compute_image" "web" {
  family = "ubuntu-2004-lts"
}

data "yandex_compute_image" "db" {
  family = "ubuntu-2004-lts"
}

# Web VM
resource "yandex_compute_instance" "web" {
  name        = local.web_vm_name
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores         = local.vm_resources["web"].cores
    memory        = local.vm_resources["web"].memory
    core_fraction = local.vm_resources["web"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.web.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_a.id
    nat       = true
  }

  metadata = local.vm_metadata
}

# DB VM
resource "yandex_compute_instance" "db" {
  name        = local.db_vm_name
  platform_id = "standard-v1"
  zone        = "ru-central1-b"

  resources {
    cores         = local.vm_resources["db"].cores
    memory        = local.vm_resources["db"].memory
    core_fraction = local.vm_resources["db"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.db.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_b.id
    nat       = true
  }

  metadata = local.vm_metadata
}