resource "null_resource" "init_helm" {
  provisioner "local-exec" {
    command = "helm init --wait && helm repo update"
  }
}

