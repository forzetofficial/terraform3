variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Name of the web VM"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID for web VM"
}

variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "Number of CPU cores for web VM"
}

variable "vm_web_memory" {
  type        = number
  default     = 2
  description = "Memory in GB for web VM"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 20
  description = "Core fraction for web VM"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Preemptible flag for web VM"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "NAT flag for web VM"
}

variable "vm_web_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Zone for web VM"
}

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image family for web VM"
}

### VM db variables

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Name of the db VM"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID for db VM"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "Number of CPU cores for db VM"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "Memory in GB for db VM"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "Core fraction for db VM"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "Preemptible flag for db VM"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "NAT flag for db VM"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Zone for db VM"
}

variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image family for db VM"
}