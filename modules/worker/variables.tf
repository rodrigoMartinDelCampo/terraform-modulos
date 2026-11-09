variable "account_id" {
  description = "Cloudflare account ID"
  type        = string
}

variable "worker_name" {
  description = "Nombre del worker"
  type        = string
}

variable "d1_database_id" {
  description = "ID de la base de datos D1 que se conecta al Worker (binding DB)"
  type        = string
}

variable "compatibility_date" {
  description = "Fecha de compatibilidad del runtime de Workers"
  type        = string
  default     = "2025-10-28"
}
