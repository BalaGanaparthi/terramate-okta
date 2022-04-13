variable "groups_filename" {
  # default = "./input_files/${terraform.workspace}/groups.csv"
}

locals {
  groups = csvdecode(file(var.groups_filename))
}


