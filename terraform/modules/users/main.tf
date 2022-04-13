resource "okta_user" "users" {
  for_each = { for user in local.users : user.login => user }

  first_name = each.value.firstName
  last_name  = each.value.lastName
  login      = each.value.login
  email      = each.value.email
  password   = each.value.password
}


# resource "okta_user" "users_count" {
#   count = 100

#   first_name = "tf_user_fn_${count.index}"
#   last_name  = "tf_user_ln_${count.index}"
#   login      = "tf_user_login_${count.index}@mydomain.com"
#   email      = "tf_user_login_${count.index}@mydomain.com"
#   password   = "SecureP@ssword${count.index}"
# }