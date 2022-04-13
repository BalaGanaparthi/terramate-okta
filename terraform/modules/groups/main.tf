resource "okta_group" "groups" {
  for_each = { for group in local.groups : group.name => group }

  name        = each.value.name
  description = each.value.description
}