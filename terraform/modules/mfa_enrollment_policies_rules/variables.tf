variable "mfa_enroll_policy_list" {
  description = "List of Profile enrollments."
}

variable "mfa_enrollment_policies_name-ids_map" {
  description = "List of Profile name id map."
}

locals {
  # Nested loop over both lists, and flatten the result.
  mfa_rules = distinct(flatten([
    for mep in var.mfa_enroll_policy_list : [
      for mep_rule in mep.rules : {
        policy-rule-key = join(".", [var.mfa_enrollment_policies_name-ids_map[mep.name], mep_rule.name])
        policy_id       = var.mfa_enrollment_policies_name-ids_map[mep.name]
        rule            = mep_rule
      }
    ]
  ]))
}