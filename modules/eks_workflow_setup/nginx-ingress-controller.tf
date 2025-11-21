resource "null_resource" "nginx_crds" {
  provisioner "local-exec" {
    command = "make nginx_crds_setup"
    environment = {
      REGION  = join(" ", [var.region])
      CLUSTER = join(" ", [var.cluster_name])
    }

  }

  depends_on = [helm_release.aws_loadbalancer_controller]
}

resource "kubernetes_namespace" "ingress_namespace" {
  metadata {
    name = "nginx-ingress"
  }

}

resource "helm_release" "nginx_ingress_controller" {
  name = "nginx-ingress"

  repository = "./helm/"
  chart      = "ingress_controller"
  version    = "0.1.0"
  namespace  = "nginx-ingress"

  depends_on = [null_resource.nginx_crds]
}

output "helm_result" {
  value = helm_release.nginx_ingress_controller.chart
}
