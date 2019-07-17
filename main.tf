resource "null_resource" "init_helm" {
  provisioner "local-exec" {
    command = "helm init --wait && helm repo update"
  }
}

resource "null_resource" "authorize_helm" {
  provisioner "local-exec" {
    command = <<EOT
      kubectl create serviceaccount --namespace kube-system tiller
      kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
      kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
    
EOT

}
}

resource "null_resource" "provision_jenkins" {
    provisioner "local-exec" {
    command = <<EOT
      kubectl create -f jenkins-namespace.yaml
      kubectl create -f jenkins-volume.yaml
      sh tiller_wait.sh
      helm install stable/jenkins -f jenkins-values.yaml -f jenkins-jobs.yaml --name jenkins-master --namespace jenkins-project
    
EOT

  }
}
