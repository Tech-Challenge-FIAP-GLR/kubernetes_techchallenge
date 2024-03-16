###### root/main.tf
module "eks" {
  source                  = "./modules/eks"
  aws_public_subnet       = module.vpc.aws_public_subnet
  vpc_id                  = module.vpc.vpc_id
  cluster_name            = "module-eks-${random_string.suffix.result}"
  endpoint_public_access  = true
  endpoint_private_access = false
  public_access_cidrs     = ["0.0.0.0/0"]
  node_group_name         = "fiaptechchallenge"
  scaling_desired_size    = 1
  scaling_max_size        = 1
  scaling_min_size        = 1
  instance_types          = ["t2.micro"]
  key_pair                = "MIIEowIBAAKCAQEA2KxX5vOEVMEPBz5tOr6h1feemVnqBR0N70O+41Kzirh5nAzHgr7bkAR0QpfVjLFDE/FjTQqhZujoKmWgdKJWTkqCh4907FLzdtFt0y4NRvQewxcoCLz44KBPOSsdzQpUpotdKh/cexYumimDxTx7zA3j/vT7jhTTCHij5RZMf5HTJn/saNV2QrQFW87LPZGlFEPpCwyeJwwshvZ7lmotl4w1UD9pp4pvM1e496hKjwxgFQsnKjDPoxTodSwhCh/fkTY3GdERtm2sVamZBAXgk7jynPRet3gv4waujqTL3SekjANDMFaFdgakQq8pDYHWFOW/4v7QbKZjdzlxQx/WFQIDAQABAoIBADhbK0ng0OySgmwp6pM6/jD/BPtyDZJi6jrvbfkGi7hrHwZdtI7nQYiGAA9KGrtLZ90KDf/94dk4fxp38HIlvzkB3E2SHKFTOgwPkPc6pS1tVYr8vOb47+rNB44hDtFD/JyM5yCLxPcm39wtLB7jCngarNClu8BK3lD3v/lYAXG0a4tF4qDDNTzdZDyPs5RZhahNYhKq3oKzSk39kScLViG5A1T+NMO0bzh6wbLOCs/2KHiMeWo9q+2tQfCh7WFW0KtG7GZAvGnmkR/SGMyZVjJsEDEJaJvZjPi76iGu/9BSFlUD1Nr/sAsF/+8QtVOL9NWTLgyoh6WoCHh/cw8tnkECgYEA9f1wQbwwKTjLvSW7fr95W7ogKJQ3ew+KweJVM5VlWjaJLybD9DTzqwtU4TcuIUAydU+0LOwBS4AQOjw1bHJqzoW8Dz6HyYDgw2fI+V1X759MTXR+b4zR9WSik9rPBRxjHIMWgULALLayHtFIOcfh6oz8xjYypg/o5Egku9MC5QkCgYEA4X2Ag8wvtWJLgXYVdZTgPRHi9S1hJiHH7Ug1w5B+ySaS6ZjslFOLGSU/g3n0p8qGxRg518AbTJRMM/IzMtEDhX6VKcqRqOL+6Z090TNeJxV9k5H8BZ1qeUulc1DZJeNuYJSfHY575iXfqld4lxTTi/4DSvSyJj6WqGp2yL3tV60CgYEAqNSNG1DB7Ujh7KvdB5z6+g3AzJkNixSbs35X49OBgG01snr0usMtChP46aopqwCYoRNXIg3IxbzbZly0ff35eE0pSX0tTQt7OCIfOabrF7dJc0+lB4KrB7VOMBRZSbS2AXenFohtxUKO9b/FxoJ9d7HUO2YvVPJOcX9iVtb4gaECgYBtX//vbiKSG+y+DjYYg69FUCDDhlCCO46LhSQ3CSbGkURftMLEq8Vj3BJzxrsqjG1UuwyLn25edeyEoe29r27C2QSncc+3mOvHC3OJvx3jXWQ9KWmSm6mizlOhnMzHuQq4JD8OCigFGcflC2q99ecrF3onaIvlSySu6n1Vn/K5PQKBgGU94rG+EKU5l+gsL3hSMUxFftid+PRzJpjKPHRa0TjpFV28KjOabGeE1zJyojRSr5y5m+r3qEiMgXhWv9LWoPaJN7u6mNWK7ETElC/QcvIDFfic5vBsJaWf8CLd0iDoKMGTCZeU9W+54xKhoPm9wcCXbGF8ZTxcYwu5fHm+atcm"
}

module "vpc" {
  source                  = "./modules/vpc"
  tags                    = "fiaptechchallenge"
  instance_tenancy        = "default"
  vpc_cidr                = "10.0.0.0/16"
  access_ip               = "0.0.0.0/0"
  public_sn_count         = 2
  public_cidrs            = ["10.0.1.0/24", "10.0.2.0/24"]
  map_public_ip_on_launch = true
  rt_route_cidr_block     = "0.0.0.0/0"

}
