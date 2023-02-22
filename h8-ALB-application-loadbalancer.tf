module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "${local.name}-alb"

  load_balancer_type = "application"

  vpc_id             = var.vpc_id
  subnets            = var.public_subnets
  security_groups    = [module.loadbalancer_sg.security_group_id]
  # HTTP Listener - Redirect HTTPs
  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

  # Target Group
  target_groups = [
    # App1 Target Group - TG Index = 0
    {
      name_prefix      = "app1"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-299"
      }
      protocol_version = "HTTP1"
      tags = local.common_tags
    },


  ]
  # HTTPs Listener
  https_listeners = [
    # HTTPS Listener Index = 0
    {
      port                 = 443
      protocol             = "HTTPS"
      certificate_arn      = module.acm.acm_certificate_arn
      # action_type = "fixed-response"
      # fixed_response = {
      #   content_type = "text/plain"
      #   message_body = "Fixed Static Message"
      #   status_code = "200"
      # }
    }
  ]
  https_listener_rules = [
    {
      https_listener_index = 0
      actions = [
        {
          type = "forward"
          target_group_index = 0
        }
      ]
      conditions=  [{
        path_patterns = ["/*"]
      }]
    }
  ]

  tags = local.common_tags
}
 
