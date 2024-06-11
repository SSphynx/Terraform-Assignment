variable "public_subnet_cidrs" {
  type        = list(string)
}

variable "private_subnet_cidrs" {
  type        = list(string)
}

variable "public_subnet_azs" {
  type        = list(string)
}

variable "private_subnet_azs" {
  type        = list(string)
}

variable "vpc_id" {
  type = string
}