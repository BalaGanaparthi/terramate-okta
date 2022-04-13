# output "user_ids" {
#   value = [for user in okta_user.users : user.id]
# }

# output "user_logins" {
#   value = [for user in okta_user.users : user.login]
# }

# output "user_logins_ids_map" {
#   value = zipmap( user_logins, user_ids )
# }

output "user_logins_ids_map" {
  value = zipmap([for user in okta_user.users : user.login], [for user in okta_user.users : user.id])
}
