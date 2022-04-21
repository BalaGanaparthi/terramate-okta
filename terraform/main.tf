
module "users" {
  source         = "./modules/users"
  users_filename = local.users_file
  depends_on = [
    module.user_base_schema_properties
  ]
}

module "groups" {
  source          = "./modules/groups"
  groups_filename = local.groups_file
}

module "users_groups" {
  source                          = "./modules/user_groups"
  user_group_memberships_filename = local.user-group_file
  user_login_id_map               = module.users.user_logins_ids_map
  group_name_id_map               = module.groups.group_name_id_map

  depends_on = [
    module.users,
    module.groups
  ]
}

module "applications" {
  source                 = "./modules/applications"
  applications_oauth_map = local.applications_map.applications_oauth
  depends_on = [
    module.users,
    module.groups
  ]
}

module "group_roles" {
  source            = "./modules/group_roles"
  group_name_id_map = module.groups.group_name_id_map
  group_roles_list  = local.group_roles_map.group_roles
  app_names_ids_map = module.applications.app_names_ids_map
  depends_on = [
    module.users,
    module.groups,
    module.applications
  ]
}

module "app_group" {
  source                   = "./modules/app_groups"
  group_name-id_map        = module.groups.group_name_id_map
  application_label-id_map = module.applications.app_names_ids_map
  application-group_map    = local.app-group_map.application_group
  depends_on = [
    module.groups,
    module.applications
  ]
}

module "profile_enrollment" {
  source                   = "./modules/profile_enrollment"
  group_name-id_map        = module.groups.group_name_id_map
  application_label-id_map = module.applications.app_names_ids_map
  profile_enrollment_map   = local.profile_enrollment_map.profile_enrollment
  depends_on = [
    module.groups,
    module.applications,
    module.user_base_schema_properties
  ]
}

module "authenticators" {
  source             = "./modules/authenticators"
  authenticators_map = local.authenticators_map.authenticators
}

module "mfa_enrollment_policies" {
  source                 = "./modules/mfa_enrollment_policies"
  group_name-id_map      = module.groups.group_name_id_map
  mfa_enroll_policy_list = local.mfa_enrollment_map.mfa_enrollment_policies
  depends_on = [
    module.groups
  ]
}

module "mfa_enrollment_policies_rules" {
  source                               = "./modules/mfa_enrollment_policies_rules"
  mfa_enroll_policy_list               = local.mfa_enrollment_map.mfa_enrollment_policies
  mfa_enrollment_policies_name-ids_map = module.mfa_enrollment_policies.mfa_enrollment_policies_name-ids_map
  depends_on = [
    module.mfa_enrollment_policies
  ]
}

module "user_base_schema_properties" {
  source                               = "./modules/user_base_schema_properties"
  user_schema_properties_map           = local.user_base_schema_properties_map
}

module "user_schema_properties" {
  source                               = "./modules/user_schema_properties"
  user_schema_properties_map           = local.user_schema_properties_map
}