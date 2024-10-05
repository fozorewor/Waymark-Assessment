module "fozo_waymark_vpc" {

    source = "./modules/vpc/vpc"
    vpc_cidr_block = "10.42.0.0/16"
    vpc_assign_generated_ipv6_cidr_block = true
    vpc_enable_dns_hostnames = false
    vpc_enable_dns_support = true
    
    vpc_tags = {
        "Name" : "fozo_waymark_vpc"
        "Purpose" : "Assesment"
        "Tenancy" : "Temporary"
    }
}

module "fozo_waymark_subnet_east_1a" {
  source = "./modules/vpc/subnet"
  subnet_vpc_id = module.fozo_waymark_vpc.id
  subnet_assign_ipv6_address_on_creation = false
  subnet_cidr_block = "10.42.0.0/17"
  availability_zone = "us-east-1a"

  subnet_tags = {
        "Name" : "fozo_waymark_subnet_east_1a"
        "Purpose" : "Assesment"
        "Tenancy" : "Temporary"
    }

    depends_on = [ module.fozo_waymark_vpc ]
}

module "fozo_waymark_subnet_east_1b" {
  source = "./modules/vpc/subnet"
  subnet_vpc_id = module.fozo_waymark_vpc.id
  subnet_assign_ipv6_address_on_creation = false
  subnet_cidr_block = "10.42.128.0/18"
  availability_zone = "us-east-1b"

  subnet_tags = {
        "Name" : "fozo_waymark_subnet_east_1b"
        "Purpose" : "Assesment"
        "Tenancy" : "Temporary"
    }

    depends_on = [ module.fozo_waymark_vpc ]
}

module "fozo_waymark_subnet_east_1c" {
  source = "./modules/vpc/subnet"
  subnet_vpc_id = module.fozo_waymark_vpc.id
  subnet_assign_ipv6_address_on_creation = false
  subnet_cidr_block = "10.42.192.0/18"
  availability_zone = "us-east-1c"

  subnet_tags = {
        "Name" : "fozo_waymark_subnet_east_1c"
        "Purpose" : "Assesment"
        "Tenancy" : "Temporary"
    }

    depends_on = [ module.fozo_waymark_vpc ]
}