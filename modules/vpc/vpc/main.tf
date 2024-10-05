resource "aws_vpc" "vpc" {
  assign_generated_ipv6_cidr_block = var.vpc_assign_generated_ipv6_cidr_block
  cidr_block                       = var.vpc_cidr_block
  # enable_classiclink               = var.vpc_enable_classiclink
  # enable_classiclink_dns_support   = var.vpc_enable_classiclink_dns_support
  enable_dns_hostnames             = var.vpc_enable_dns_hostnames
  enable_dns_support               = var.vpc_enable_dns_support
  instance_tenancy                 = var.vpc_instance_tenancy

  tags = var.vpc_tags

}
