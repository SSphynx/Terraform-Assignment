variable "vpc_id" {
  type = string
}

variable "http_port" {
  type    = number
  default = 80
}

variable "https_port" {
  type    = number
  default = 443
}

variable "ssh_port" {
  type    = number
  default = 22
}
