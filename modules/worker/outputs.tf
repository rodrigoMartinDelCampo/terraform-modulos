output "worker_url" {
  description = "URL predeterminada del Worker en workers.dev"
  value       = data.cloudflare_worker.hello.subdomain.url
}

output "script_name" {
  description = "Nombre del script del Worker"
  value       = cloudflare_workers_script.hello.script_name
}
