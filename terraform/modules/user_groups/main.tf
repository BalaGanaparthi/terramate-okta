resource "okta_user_group_memberships" "user_group_membership" {
  for_each = { for user in local.user_group_memberships_map : user.id => user }

  user_id = var.user_login_id_map[each.value.userlogin]
  groups  = [var.group_name_id_map[each.value.groupname]]
}
