variable "vpc_id" {
  type = string
}

variable "nat_gateway_id" {
  type = string
  default = null
}

variable "private_subnet_ids" {
  type = list(string)
  default = []
}
