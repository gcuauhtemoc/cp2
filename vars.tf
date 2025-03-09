# grupo de recursos
variable "resource_group_name" {
  description = "Nombre del grupo de recursos"
  type        = string
  default     = "grupo_gcs_cp2"
}

# Ubicacion Azure
variable "location" {
  description = "Región de ubicacion de recursos"
  type        = string
  default     = "East US"
}

# Configuracion de la VM
variable "vm_name" {
  description = "Nombre de la Maquina Virtual"
  type        = string
  default     = "vm_gcs_cp2"
}

variable "vm_size" {
  description = "Tamaño de VM"
  type        = string
  default     = "Standard_D1_v2"
}
