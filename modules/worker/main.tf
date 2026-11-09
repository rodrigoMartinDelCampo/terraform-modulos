# Worker (script + binding a la D1)
resource "cloudflare_workers_script" "hello" {
  account_id         = var.account_id
  script_name        = var.worker_name
  main_module        = "worker.js"
  content            = file("${path.module}/worker.js")
  compatibility_date = var.compatibility_date

  bindings = [
    {
      name = "DB"
      type = "d1"
      id   = var.d1_database_id
    }
  ]
}

# Subdominio workers.dev del Worker
resource "cloudflare_workers_script_subdomain" "hello" {
  account_id  = var.account_id
  script_name = cloudflare_workers_script.hello.script_name
  enabled     = true
}

# Se usa solo para leer la URL del Worker
data "cloudflare_worker" "hello" {
  account_id = var.account_id
  worker_id  = cloudflare_workers_script.hello.id

  # Esperar a que el subdominio este activado antes de leer la URL
  depends_on = [cloudflare_workers_script_subdomain.hello]
}
