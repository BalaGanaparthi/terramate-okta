variable "users_filename" {
  # default = "./input_files/${terraform.workspace}/users.csv"
}

locals {
  users = csvdecode(file(var.users_filename))
}