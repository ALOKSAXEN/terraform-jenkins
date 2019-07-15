
provider "external" {
  version = "~> 1.0"
}

data "external" "aws_iam_authenticator" {
  program = ["bash", "authenticator.sh"]

  query {
    cluster_name = "DOTS_cluster"
  }
}

provider "kubernetes" {
  token = "${data.external.aws_iam_authenticator.result.token}"
  version = "~> 1.1"
}
