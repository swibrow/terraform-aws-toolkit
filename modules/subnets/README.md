# IP Subnet Calculator

Creates a list of networks based on a specified subnet name and size, represented in CIDR notation.


Similar to this module
https://github.com/hashicorp/terraform-cidr-subnets

```hcl

module "subnets" {
  source = "./modules/subnets"

  availability_zones = 3
  base_cidr_block = "10.0.0.0/16"

  subnets = [
    {"public" = 24},
    {"private" = 24},
  ]
}
```

```hcl
Changes to Outputs:
  + base_cidr_block     = "10.0.0.0/16"
  + network_cidr_blocks = {
      + private-eu-central-1a = "10.0.3.0/24"
      + private-eu-central-1b = "10.0.4.0/24"
      + private-eu-central-1c = "10.0.5.0/24"
      + public-eu-central-1a  = "10.0.0.0/24"
      + public-eu-central-1b  = "10.0.1.0/24"
      + public-eu-central-1c  = "10.0.2.0/24"
    }
  + networks            = [
      + {
          + az         = "eu-central-1a"
          + cidr_block = "10.0.0.0/24"
          + hosts      = 252
          + name       = "public"
        },
      + {
          + az         = "eu-central-1b"
          + cidr_block = "10.0.1.0/24"
          + hosts      = 252
          + name       = "public"
        },
      + {
          + az         = "eu-central-1c"
          + cidr_block = "10.0.2.0/24"
          + hosts      = 252
          + name       = "public"
        },
      + {
          + az         = "eu-central-1a"
          + cidr_block = "10.0.3.0/24"
          + hosts      = 252
          + name       = "private"
        },
      + {
          + az         = "eu-central-1b"
          + cidr_block = "10.0.4.0/24"
          + hosts      = 252
          + name       = "private"
        },
      + {
          + az         = "eu-central-1c"
          + cidr_block = "10.0.5.0/24"
          + hosts      = 252
          + name       = "private"
        },
    ]
```
