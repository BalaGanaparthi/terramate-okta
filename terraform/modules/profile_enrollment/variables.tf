variable "profile_enrollment_map" {
  description = "List of Profile enrollments."
}

variable "group_name-id_map" {}

variable "application_label-id_map" {}

locals {
  name-id = zipmap([for pe in okta_policy_profile_enrollment.profile_enrollment : pe.name], [for pe in okta_policy_profile_enrollment.profile_enrollment : pe.id])
}
