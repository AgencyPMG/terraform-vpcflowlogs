variable "app" {
    type = "string"
    description = "The application name, used in the `Application` tags."
}

variable "env" {
    type = "string"
    description = "The application environment (prod, staging, etc). Pass in terraform.env here if you like. Used in the `Environment` tags."
}

variable "vpc_id" {
    type = "string"
    description = "The VPC to be logged"
}

variable "traffic_type" {
    type = "string"
    description = "The traffic type to track (ACCEPT, REJECT, ALL)"
}
