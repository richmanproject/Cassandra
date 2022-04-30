resource "aws_elb" "ter-elb" {
  name               = "ter-elb"
 # load_balancer_type = "application"
  #availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  security_groups    = [aws_security_group.elb_sg.id]
  subnets            = [aws_subnet.public-subnet-1.id]#, aws_subnet.public-subnet-2.id, aws_subnet.public-subnet-3.id]
 # access_logs {
   # bucket        = "foo"
    #bucket_prefix = "bar"
   # interval      = 60
  #}

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  #listener {
    #instance_port      = 8000
    #instance_protocol  = "http"
    #lb_port            = 443
    #lb_protocol        = "https"
    #ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
 # }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = ["aws_instance.demo1.id", "aws_instance.demo2.id", "aws_instance.demo3.id"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "ter-elb"
  }
}