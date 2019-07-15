resource "kubernetes_namespace" "example" {
  metadata {
    name = "${var.namespace_name}"
    labels {
      name = "example-label"
    }
    annotations {
      name = "example-annotation"
    }
  }
}
