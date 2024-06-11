variable "vpc_id" {
  type = string
}

variable "internet_gateway_id" {
  type = string
  default = null
}

variable "public_subnet_ids" {
  type = list(string)
  default = []
}



