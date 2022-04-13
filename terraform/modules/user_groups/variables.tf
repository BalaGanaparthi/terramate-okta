variable "user_group_memberships_filename" {
  # default = "./input_files/${terraform.workspace}/user_group_memberships.csv"
}

locals {
  user_group_memberships_map = csvdecode(file(var.user_group_memberships_filename))
}

variable "user_login_id_map" {}

variable "group_name_id_map" {}