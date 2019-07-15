resource "kubernetes_namespace" "example" {
  metadata {
    name = "${var.namespace_name}"
    labels {
      name = "DOTS-label"
    }
    annotations {
      name = "DOTS-annotation"
    }
  }
}
