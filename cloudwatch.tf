resource "aws_cloudwatch_log_group" "vpcflow" {
  name              = "${var.app}${var.env}-vpcflow-${lower(var.traffic_type)}"
  retention_in_days = 30
}

