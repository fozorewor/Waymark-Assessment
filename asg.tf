module "fozo_waymark_vpc_sg" {
  source = "./modules/vpc/security_group"
  name   = "fozo_waymark_vpc_sg"
  vpc_id = module.fozo_waymark_vpc.id
  tags = {
    "Name" : "fozo_waymark_vpc_sg"
    "Purpose" : "Assesment"
    "Tenancy" : "Temporary"
  }
}

module "fozo_waymark_vpc_sg_rule_inbound_8200" {
  source            = "./modules/vpc/security_group_rule"
  security_group_id = module.fozo_waymark_vpc_sg.id
  type              = "ingress"
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  to_port           = 8200
  from_port         = 8200
  depends_on        = [module.fozo_waymark_vpc_sg]

}

module "fozo_waymark_vpc_sg_rule_outbound_anywhere" {
  source            = "./modules/vpc/security_group_rule"
  security_group_id = module.fozo_waymark_vpc_sg.id
  type              = "egress"
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  to_port           = 0
  from_port         = 0
  depends_on        = [module.fozo_waymark_vpc_sg]
}

module "fozo_waymark_hashicorp_iam_role" {
  source        = "./modules/iam/iam_role"
  iam_role_name = "fozo_waymark_hashicorp_iam_role"
  iam_role_assume_role_policy_template = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  iam_role_managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonRDSDataFullAccess"]
  tags = {
    "Name" : "fozo_waymark_hashicorp_iam_role"
    "Purpose" : "Assesment"
    "Tenancy" : "Temporary"
  }

}

module "fozo_waymark_iam_instance_profile_vault" {
  source                    = "./modules/iam/iam_instance_profile"
  iam_instance_profile_name = "fozo_waymark_iam_instance_profile_vault"
  iam_instance_profile_role = module.fozo_waymark_hashicorp_iam_role.id
  tags = {
    "Name" : "fozo_waymark_iam_instance_profile_vault"
    "Purpose" : "Assesment"
    "Tenancy" : "Temporary"
  }
  depends_on = [module.fozo_waymark_hashicorp_iam_role]

}

module "fozo_waymark_lauch_template_vault_hashicorp" {
  source               = "./modules/asg/launch_template"
  name                 = "fozo_waymark_lauch_template_vault_hashicorp"
  image_id             = "ami-0fff1b9a61dec8a5f"
  iam_instance_profile = module.fozo_waymark_iam_instance_profile_vault.name
  security_groups      = [module.fozo_waymark_vpc_sg.id]
  user_data            = file("./user_data.sh")
  instance_type        = "t2.micro"

  tags = {
    "Name" : "fozo_waymark_lauch_template_vault_hashicorp"
    "Purpose" : "Assesment"
    "Tenancy" : "Temporary"
  }

  depends_on = [module.fozo_waymark_iam_instance_profile_vault]

}

module "fozo_waymark_asg" {
  source                    = "./modules/asg/asg"
  name                      = "fozo_waymark_asg"
  subnets                   = [module.fozo_waymark_subnet_east_1a.id, module.fozo_waymark_subnet_east_1b.id, module.fozo_waymark_subnet_east_1c.id]
  launch_template           = module.fozo_waymark_lauch_template_vault_hashicorp.id
  min_size                  = 1
  max_size                  = 2
  desired_capacity          = 1
  health_check_grace_period = 300

  depends_on = [module.fozo_waymark_lauch_template_vault_hashicorp]

  tags = {
    "Name" : "fozo_waymark_asg"
    "Purpose" : "Assesment"
    "Tenancy" : "Temporary"
  }

}
