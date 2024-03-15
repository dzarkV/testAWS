variable "access_key" {
  description = "The AWS access key"
  type        = string
}

variable "secret_key" {
  description = "The AWS secret key"
  type        = string
}

variable "username_db" {
  description = "The RDS username"
  type = string
}

variable "password_db" {
  description = "The RDS password"
  type = string
}