resource "okta_policy_profile_enrollment" "profile_enrollment" {
  for_each = var.profile_enrollment_map

  name   = each.value.name
  status = "ACTIVE"
}

resource "okta_policy_rule_profile_enrollment" "profile_enrollment_rule" {

  for_each = var.profile_enrollment_map

  policy_id          = local.name-id[each.value.name]
  target_group_id    = var.group_name-id_map[each.value.rule.target_group_name]
  email_verification = each.value.rule.email_verification

  unknown_user_action = "REGISTER"
  access              = "ALLOW"

  dynamic "profile_attributes" {
    for_each = each.value.rule.profile_attributes
    content {
      name     = profile_attributes.value.name
      label    = profile_attributes.value.label
      required = profile_attributes.value.required
    }
  }
}

resource "okta_policy_profile_enrollment_apps" "profile_enrollment_apps" {
  for_each = var.profile_enrollment_map

  policy_id = local.name-id[each.value.name]
  apps      = [for app_label in each.value.apps : var.application_label-id_map[app_label]]
}