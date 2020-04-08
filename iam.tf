data "aws_iam_policy_document" "vpcflow_role" {
  statement {
    sid     = "AllowVpcFlowAssume"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "vpcflow" {
  name               = "vpcflow-${lower(var.traffic_type)}@${var.app}${var.env}"
  assume_role_policy = data.aws_iam_policy_document.vpcflow_role.json
}

data "aws_iam_policy_document" "vpcflow_perms" {
  statement {
    sid    = "AllowDescribeStream"
    effect = "Allow"
    actions = [
      "logs:DescribeLogGroups",
    ]
    resources = [
      aws_cloudwatch_log_group.vpcflow.arn,
    ]
  }

  statement {
    sid    = "AllowLogStreamsAndEvents"
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
    ]
    resources = [
      "${aws_cloudwatch_log_group.vpcflow.arn}:*",
    ]
  }
}

resource "aws_iam_role_policy" "vpcflow_perms" {
  name_prefix = "cloudwatch-logs-${lower(var.traffic_type)}"
  role        = aws_iam_role.vpcflow.id
  policy      = data.aws_iam_policy_document.vpcflow_perms.json
}

