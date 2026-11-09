resource "cloudflare_d1_database" "this" {
  account_id = var.account_id
  name       = var.d1_database_name
}
