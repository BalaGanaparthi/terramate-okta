
locals {
  users_file = "./input_files/${terraform.workspace}/users.csv"

  groups_file = "./input_files/${terraform.workspace}/groups.csv"

  user-group_file = "./input_files/${terraform.workspace}/user-group.csv"

  group_roles_map = jsondecode(file("./input_files/${terraform.workspace}/group-role.json"))

  applications_map = jsondecode(file("./input_files/${terraform.workspace}/applications.json"))

  app-group_map = jsondecode(file("./input_files/${terraform.workspace}/application-group.json"))

  profile_enrollment_map = jsondecode(file("./input_files/${terraform.workspace}/profile_enrollment.json"))

  authenticators_map = jsondecode(file("./input_files/${terraform.workspace}/authenticators.json"))

  mfa_enrollment_map = jsondecode(file("./input_files/${terraform.workspace}/mfa_enrollment.json"))

  user_schema_properties_map = jsondecode(file("./input_files/${terraform.workspace}/user_schema_properties.json"))

  user_base_schema_properties_map = jsondecode(file("./input_files/${terraform.workspace}/user_base_schema_properties.json"))
} 