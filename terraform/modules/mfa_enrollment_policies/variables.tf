variable "mfa_enroll_policy_list" {
  description = "List of Profile enrollments."
}

variable "group_name-id_map" {}

locals {
  name-id = zipmap([for mep in okta_policy_mfa.mfa_enroll_policy : mep.name], [for mep in okta_policy_mfa.mfa_enroll_policy : mep.id])
}

locals {

  # Nested loop over both lists, and flatten the result.
  mfa_rules = distinct(flatten([
    for mep in var.mfa_enroll_policy_list : [
      for mep_rules in mep.rules : {
        policy_id = local.name-id[mep.name]
        rule      = mep_rules
      }
    ]
  ]))
}