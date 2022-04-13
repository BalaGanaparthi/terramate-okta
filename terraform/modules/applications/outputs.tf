output "app_names_ids_map" {
  value = zipmap([for app in okta_app_oauth.applications_oauth : app.label], [for app in okta_app_oauth.applications_oauth : app.id])
}