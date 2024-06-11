variable "db_username" {
  description = "The username for the DB instance"
  type        = string
}

variable "db_password" {
  description = "The password for the DB instance"
  type        = string
}

variable "db_subnet_group_name" {
  description = "The DB subnet group name"
  type        = string
}

variable "rds_security_group_id" {
  description = "The ID of the RDS security group"
  type        = string
}
