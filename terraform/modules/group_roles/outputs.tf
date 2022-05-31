output "group_role_ids_map" {
  value = [for group_role in okta_group_role.group_role_assignments : group_role.id]
}

output "group_role_obj" {
  value = [for group_role in okta_group_role.group_role_assignments : group_role]
}