variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "public_subnet_azs" {
  description = "Availability zones for public subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnet_azs" {
  description = "Availability zones for private subnets"
  type        = list(string)
  default     = ["us-east-1d", "us-east-1e", "us-east-1f"]
}

variable "existing_key_name" {
  description = "Name of the existing key pair"
  type        = string
  default     = "312.pem.pub" 
}

variable "ami_id" {
  type = string
  default = "ami-0d191299f2822b1fa"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the WordPress database"
  type        = string
  default     = "mydb"
}
