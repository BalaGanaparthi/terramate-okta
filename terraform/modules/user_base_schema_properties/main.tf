data "okta_user_type" "okta_default_user" {
  name = "user"
}

resource "okta_user_base_schema_property" "login_user_base_schema_property" {
  # for_each = { for property in local.user_schema_properties : property.index => property }
  # for_each = var.user_schema_properties_map

  index       = var.user_schema_properties_map.login.index
  title       = var.user_schema_properties_map.login.title
  type        = var.user_schema_properties_map.login.type
  required    = var.user_schema_properties_map.login.required
  master      = var.user_schema_properties_map.login.master
  pattern     = var.user_schema_properties_map.login.pattern
  permissions = var.user_schema_properties_map.login.permissions
  user_type   = "${data.okta_user_type.okta_default_user.id}"
}

resource "okta_user_base_schema_property" "other_user_base_schema_property" {
  # for_each = { for property in local.user_schema_properties : property.index => property }
  for_each = { for property in var.user_schema_properties_map.others : property.index => property }

  index       = each.value.index
  title       = each.value.title
  type        = each.value.type
  required    = each.value.required
  master      = each.value.master
  permissions = each.value.permissions
  user_type   = "${data.okta_user_type.okta_default_user.id}"
}