resource "aws_security_group" "elb_security_group" {
  name        = "${var.application_name}-ELB-Security-Group"
  description = "Manage ELB Traffic"


  ingress {
    description = "allow-http-${var.frontend_port}"
    from_port   = var.frontend_port
    to_port     = var.frontend_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = "web_app"
  }
}

resource "aws_security_group" "application_server_security_group" {
  name        = "${var.application_name}-Server-Security-Group"
  description = "Manage traffic to app servers"


  ingress {
    description = "allow-http-${var.backend_port}"
    from_port   = var.backend_port
    to_port     = var.backend_port
    protocol    = "tcp"
    security_groups = [aws_security_group.elb_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = "web_app"
  }
}