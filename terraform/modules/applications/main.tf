
resource "okta_app_oauth" "applications_oauth" {
  for_each = var.applications_oauth_map

  label                      = each.value.label
  type                       = each.value.type
  grant_types                = each.value.grant_types
  token_endpoint_auth_method = each.value.token_endpoint_auth_method
  redirect_uris              = each.value.redirect_uris
  post_logout_redirect_uris  = each.value.post_logout_redirect_uris
}