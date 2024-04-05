data "aws_availability_zones" "available" {}

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, var.availability_zones)

  subnet_list = flatten([
    for subnet_map in var.subnets : [
      for subnet_name, size in subnet_map : [
        for az in local.azs : {
          name     = subnet_name,
          az       = az,
          new_bits = size - tonumber(split("/", var.base_cidr_block)[1])
          hosts    = pow(2, 32 - size) - 4 # 2 reserved, 1 network, 1 broadcast
        }
      ]
    ]
  ])

  network_by_index = cidrsubnets(var.base_cidr_block, local.subnet_list[*].new_bits...)

  network_by_name = { for i, n in local.subnet_list : "${n.name}-${n.az}" => local.network_by_index[i] if n.name != null }

  networks = [for i, n in local.subnet_list : {
    name       = n.name
    az         = n.az
    hosts      = n.hosts
    cidr_block = n.name != null ? local.network_by_index[i] : tostring(null)
  }]
}
