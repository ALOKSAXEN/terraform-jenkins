provider "external" {
  version = "~> 1.0"
}

data "external" "aws_iam_authenticator" {
  program = ["bash", "authenticator.sh"]

  query {
    cluster_name = "${var.cluster_name}"
  }
}

provider "kubernetes" {
  token = "${data.external.aws_iam_authenticator.result.token}"
  version = "~> 1.1"
}

provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}
