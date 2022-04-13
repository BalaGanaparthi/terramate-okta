resource "okta_authenticator" "phone_authenticator" {
  for_each = var.authenticators_map

  name     = each.value.name
  key      = each.value.key
  status   = each.value.status
  settings = jsonencode(each.value.settings)
}