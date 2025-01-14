variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type        = string
}

variable "security_group_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "rds_endpoint" {
  type        = string
}

variable "db_name" {
  type        = string
  default     = "mydb"
}