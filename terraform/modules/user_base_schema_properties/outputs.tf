
# output "user_logins_ids_map" {
#   value = zipmap(
#                   [for property in okta_user_base_schema_property.user_base_schema_property : property.index], 
#                   [for property in okta_user_base_schema_property.user_base_schema_property : property.id]
#                 )
# }
