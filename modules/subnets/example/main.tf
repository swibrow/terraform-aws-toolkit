module "subnets" {
  source = "../"

  availability_zones = 3
  base_cidr_block    = "10.0.0.0/16"

  subnets = [
    { "public" = 24 },
    { "private" = 24 },
  ]
}