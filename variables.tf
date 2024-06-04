# variables.tf

variable "instance_name_us_east_1" {
  description = "Name for the EC2 instance in us-east-1"
  default     = "instance-east-1"
}

variable "instance_name_us_east_2" {
  description = "Name for the EC2 instance in us-east-2"
  default     = "instance-east-2"
}

variable "instance_type_us_east_1" {
  description = "Instance type for the EC2 instance in us-east-1"
  default     = "t2.small"
}

variable "instance_type_us_east_2" {
  description = "Instance type for the EC2 instance in us-east-2"
  default     = "t2.small"
}

variable "availability_zone_us_east_1" {
  description = "The availability zone for the subnet in us-east-1"
  default     = "us-east-1a"
}

variable "availability_zone_us_east_2" {
  description = "The availability zone for the subnet in us-east-2"
  default     = "us-east-2a"
}