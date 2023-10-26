/**
  * <!-- Module variables go here.
  *      Always include descriptions as they will populate
  *      autogenerated documentation. -->
*/

variable "name" {
  type        = string
  description = <<-EOT
    Name of the VPC.  Used to name various other resources.
  EOT
}

variable "availability_zones" {
  type        = list(string)
  description = <<-EOT
    Availability zones to create resources in.
  EOT
}

variable "vpc_ip_address" {
  type        = string
  description = <<-EOT
    Base IP address block for VPC. Combined with `vpc_netmask_length` to form
    CIDR for the VPC.
    Conflicts with `ipam_pool_id`.
  EOT
  default     = null
}

variable "vpc_netmask_length" {
  type        = number
  description = <<-EOT
    The netmask length of the IPv4 CIDR to allocate to this VPC.
  EOT
}

variable "ipam_pool_id" {
  type        = string
  description = <<-EOT
    The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR.
    Conflicts with `vpc_ip_address`.
  EOT
  default     = null
}

variable "subnets_netmask_length" {
  type        = string
  description = <<-EOT
    The netmask length of the IPv4 CIDR you want to allocate to subnets.
    Must be greater than `vpc_netmask_lengthh`
  EOT
}

variable "attach_transit_gateway" {
  type        = bool
  description = <<-EOT
    Toggle Transit Gateway attachment.
    Requires `transit_gateway_id`.
  EOT
  default     = false
}

variable "transit_gateway_id" {
  type        = string
  description = <<-EOT
    Transit gateway to connect to.
    Requires `attach_transit_gateway`.
    Conflicts with `create_nat_gateways`.
  EOT
  default     = null
}

variable "create_public_subnets" {
  type        = bool
  description = <<-EOT
    Toggle public subnet creation.
  EOT
  default     = false
}

variable "create_nat_gateways" {
  type        = bool
  description = <<-EOT
    Toggle nat gateway creation.
    Conflicts with `transit_gateway_id`.
    Requires `create_public_subnets`.
  EOT
  default     = false
}