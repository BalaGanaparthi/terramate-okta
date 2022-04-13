resource "okta_policy_rule_mfa" "mfa_enroll_policy_rule" {
  for_each = { for mepr in local.mfa_rules : mepr.policy-rule-key => mepr }

  policy_id = each.value.policy_id
  name      = each.value.rule.name
  status    = each.value.rule.status
  enroll    = each.value.rule.enroll
  priority  = each.value.rule.priority
}