resource "aws_subnet" "subnet" {

  vpc_id                          = var.subnet_vpc_id
  assign_ipv6_address_on_creation = var.subnet_assign_ipv6_address_on_creation
  cidr_block                      = var.subnet_cidr_block
  map_public_ip_on_launch         = var.subnet_map_public_ip_on_launch
  availability_zone               = var.availability_zone
  tags = var.subnet_tags

}
