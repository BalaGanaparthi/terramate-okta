output "user_login_id_map" {
  value = module.users.user_logins_ids_map
}

output "group_name_id_map" {
  value = module.groups.group_name_id_map
}

output "group_role_ids" {
  value = module.group_roles.group_role_ids_map
}

output "app_names_ids_map" {
  value = module.applications.app_names_ids_map
}

output "mfa_enrollment_policies_name-ids_map" {
  value = module.mfa_enrollment_policies.mfa_enrollment_policies_name-ids_map
}