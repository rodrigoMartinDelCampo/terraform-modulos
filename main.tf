# Modulo 1: base de datos D1
module "d1" {
  source = "./modules/d1"

  account_id       = var.account_id
  d1_database_name = var.d1_database_name
}

# Modulo 2: Worker (usa el ID que entrega el modulo d1)
module "worker" {
  source = "./modules/worker"

  account_id     = var.account_id
  worker_name    = var.worker_name
  d1_database_id = module.d1.database_id
}
