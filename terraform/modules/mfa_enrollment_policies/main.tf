
resource "okta_policy_mfa" "mfa_enroll_policy" {
  for_each = var.mfa_enroll_policy_list

  name        = each.value.name
  description = each.value.description
  status      = each.value.status
  is_oie      = each.value.is_oie

  okta_password = {
    enroll = each.value.okta_password.enroll
  }

  okta_email = {
    enroll = each.value.okta_email.enroll
  }

  phone_number = {
    enroll = each.value.phone_number.enroll
  }

  okta_verify = {
    enroll = each.value.okta_verify.enroll
  }

  google_otp = {
    enroll = each.value.google_otp.enroll
  }

  fido_webauthn = {
    enroll = each.value.fido_webauthn.enroll
  }

  groups_included = [for group_name in each.value.groups_included : var.group_name-id_map[group_name]]

}