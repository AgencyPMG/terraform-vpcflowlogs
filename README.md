# Terraform VPC Flow Logs Module

A terraform module that sets up VPC flow logs

## What's Included

- A **Cloudwatch Log Group** into which the vpc flow logs are written.
- An **IAM Role** that the flow logs service can assume and grants permissions
  for the cloudwatch log group.


## Usage

```hcl
module "vpcflow" {
    source = "github.com/AgencyPMG/terraform-vpcflowlogs"
    app = "appname"
    env = "prod" // or ${terraform.env}
    vpc_id = "${aws_vpc.main.id}" // or whatever
    traffic_type = "ALL" // or REJECT or ACCEPT
}
```

It should be safe to use this multiple times if you'd like to have separate log
groups for accept/reject rather than just using `ALL`.

```hcl
module "vpc_flow_accept" {
    source = "github.com/AgencyPMG/terraform-vpcflowlogs"
    app = "appname"
    env = "prod" // or ${terraform.env}
    vpc_id = "${aws_vpc.main.id}"
    traffic_type = "ACCEPT"
}

module "vpc_flow_reject" {
    source = "github.com/AgencyPMG/terraform-vpcflowlogs"
    app = "appname"
    env = "prod" // or ${terraform.env}
    vpc_id = "${aws_vpc.main.id}"
    traffic_type = "REJECT"
}
```
