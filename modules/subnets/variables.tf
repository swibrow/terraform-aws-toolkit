variable "availability_zones" {
  description = "The number of availability zones to use"
  type        = number
  default     = 3
}

variable "base_cidr_block" {
  description = "The CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnets" {
  description = "List of networks objects with their name and size in bits. The order of the list should not change."
  type        = list(map(number))
  default     = []
}
