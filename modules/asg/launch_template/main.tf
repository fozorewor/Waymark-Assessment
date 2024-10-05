resource "aws_launch_template" "ecs_launch_template" {
    name = var.name
    image_id                = var.image_id
  
    iam_instance_profile {
            name = var.iam_instance_profile
    }
    vpc_security_group_ids  = var.security_groups
    user_data               =  base64encode(var.user_data)
    instance_type           = var.instance_type 
    key_name                = var.key_name

    tags = var.tags

}