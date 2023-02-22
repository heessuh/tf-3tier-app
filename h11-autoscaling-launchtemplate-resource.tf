resource "aws_launch_template" "my_new_lt" {
  name = "my-new-launch-template"
  image_id = data.aws_ami.amazonlinux2.id
  description = "My new Launch Template"
  instance_type = var.instance_type
  
  key_name = var.instance_keypair
  vpc_security_group_ids = [module.private_sg.security_group_id]

  user_data = filebase64("${path.module}/app1-install.sh")

  disable_api_termination = true
  ebs_optimized = true
  update_default_version = true

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 8
      volume_type = "gp2"
      delete_on_termination = true
    }
  }
  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "appserver"
    }
  }


}