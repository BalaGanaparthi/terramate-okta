# output "group_ids" {
#   value = [for group in okta_group.groups : group.id]
# }

# output "group_names" {
#   value = [for group in okta_group.groups : group.name]
# }

# output "group_name_id_map" {
#   value = zipmap( module.groups.group_names, module.groups.group_ids )
# }

output "group_name_id_map" {
  value = zipmap([for group in okta_group.groups : group.name], [for group in okta_group.groups : group.id])
}