resource "okta_group_role" "group_role_assignments" {
  for_each = var.group_roles_list

  group_id          = var.group_name_id_map[each.value.group_name]
  role_type         = each.value.role_type
  target_group_list = [for group_name in each.value.target_group_list : var.group_name_id_map[group_name]]
  target_app_list   = each.value.target_app_list
  # target_app_list       = [for app_name in each.value.target_app_list : var.app_names_ids_map[app_name]]
  # target_app_list       = [for app_name in each.value.target_app_list : join(".", [app_name, var.app_names_ids_map[app_name]]) ]
  disable_notifications = each.value.disable_notifications
}