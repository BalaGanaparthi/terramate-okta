variable "group_roles_list" {
  description = "List of Group Roles mappings."
  type = map(object({
    group_name            = string
    role_type             = string
    target_group_list     = list(string)
    target_app_list       = list(string)
    disable_notifications = bool
  }))
}

variable "group_name_id_map" {}

variable "app_names_ids_map" {}