resource "aws_flow_log" "main" {
    vpc_id = "${var.vpc_id}"
    log_destination = "${aws_cloudwatch_log_group.vpcflow.arn}"
    iam_role_arn = "${aws_iam_role.vpcflow.arn}"
    traffic_type = "${var.traffic_type}"
}
