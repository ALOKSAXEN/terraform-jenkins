variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-east-1"
}

variable "namespace_name" {
  default = "DOTS-service"
  type    = "string"
}

variable "cluster_name" {
  default = "DOTS_cluster"
  type    = "string"
}
