# Modulo: worker

Despliega un Cloudflare Worker con su subdominio `workers.dev` y un binding
a una base de datos D1 (`env.DB`). El script (`worker.js`) responde un JSON a
cada peticion GET y registra la visita en la D1.

## Recursos

| Tipo | Nombre |
|---|---|
| `cloudflare_workers_script` | `hello` |
| `cloudflare_workers_script_subdomain` | `hello` |
| `data.cloudflare_worker` | `hello` |

## Inputs

| Variable | Tipo | Requerida | Descripcion |
|---|---|---|---|
| `account_id` | string | si | Cloudflare account ID |
| `worker_name` | string | si | Nombre del Worker |
| `d1_database_id` | string | si | ID de la D1 para el binding `DB` |
| `compatibility_date` | string | no (`2025-10-28`) | Fecha de compatibilidad del runtime |

## Outputs

| Output | Descripcion |
|---|---|
| `worker_url` | URL del Worker en workers.dev |
| `script_name` | Nombre del script desplegado |

## Uso

```hcl
module "worker" {
  source         = "./modules/worker"
  account_id     = var.account_id
  worker_name    = var.worker_name
  d1_database_id = module.d1.database_id
}
```
