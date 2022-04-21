data "okta_user_type" "okta_default_user" {
  name = "user"
}

resource "okta_user_schema_property" "basic_user_schema_property" {
  for_each = { for property in var.user_schema_properties_map.basic : property.index => property }

  user_type   = "${data.okta_user_type.okta_default_user.id}"

  index       = each.value.index
  title       = each.value.title
  type        = each.value.type
  required    = each.value.required
  master      = each.value.master
  description = each.value.description
  min_length  = each.value.min_length
  max_length  = each.value.max_length
  permissions = each.value.permissions
  scope       = each.value.scope
  unique      = each.value.unique
  external_name = each.value.external_name
  external_namespace = each.value.external_namespace

}

resource "okta_user_schema_property" "enum_basic_user_schema_property" {
  for_each = { for property in var.user_schema_properties_map.enum : property.index => property }

  user_type   = "${data.okta_user_type.okta_default_user.id}"

  index       = each.value.index
  title       = each.value.title
  type        = each.value.type
  required    = each.value.required
  master      = each.value.master
  description = each.value.description
  enum        = [ for enum in each.value.enum : enum.const]
  min_length  = each.value.min_length
  max_length  = each.value.max_length
  permissions = each.value.permissions
  scope       = each.value.scope
  external_name = each.value.external_name
  external_namespace = each.value.external_namespace

  dynamic "one_of" {
    for_each = each.value.enum
    content {
        title = one_of.value.title
        const = one_of.value.const
    }
  }

}
resource "okta_user_schema_property" "array_enum_basic_user_schema_property" {
  for_each = { for property in var.user_schema_properties_map.array_enum : property.index => property }

  user_type   = "${data.okta_user_type.okta_default_user.id}"

  index       = each.value.index
  title       = each.value.title
  type        = each.value.type
  array_type  = each.value.array_type
  required    = each.value.required
  master      = each.value.master
  description = each.value.description
  array_enum  = [ for enum in each.value.array_enum : enum.const]
  # min_length  = each.value.min_length
  # max_length  = each.value.max_length
  permissions = each.value.permissions
  scope       = each.value.scope
  external_name = each.value.external_name
  external_namespace = each.value.external_namespace

  dynamic "array_one_of" {
    for_each = each.value.array_enum
    content {
        title = array_one_of.value.title
        const = array_one_of.value.const
    }
  }

}
