variable "ec_ami" {
  description = "AWS image ID"
  type        = string
}

variable "networking_var_public_subnet" {
  description = "public subnet ID passed from networking module"
  type        = string
}

variable "networking_var_private_subnet" {
  description = "private subnet ID passed from networking module"
  type        = string
}