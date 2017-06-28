resource "aws_flow_log" "main" {
    vpc_id = "${var.vpc_id}"
    log_group_name = "${aws_cloudwatch_log_group.vpcflow.name}"
    iam_role_arn = "${aws_iam_role.vpcflow.arn}"
    traffic_type = "${var.traffic_type}"
}
