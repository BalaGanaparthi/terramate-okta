resource "okta_app_group_assignment" "app-a_assign_okta-oie_group" {

  for_each = var.application-group_map

  app_id   = var.application_label-id_map[each.value.app_label]
  group_id = var.group_name-id_map[each.value.group_name]

}