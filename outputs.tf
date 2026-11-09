output "worker_url" {
  description = "URL predeterminada del Worker en workers.dev"
  value       = module.worker.worker_url
}

output "d1_database_id" {
  description = "ID de la base de datos D1"
  value       = module.d1.database_id
}
