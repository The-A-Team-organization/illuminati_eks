.PHONY: init plan apply destroy ingress_setup

init:
	terraform init

plan: init
	terraform plan

apply: init
	terraform apply 

destroy: init
	terraform destroy 

nginx_crd_setup:
	aws eks update-kubeconfig --region ${REGION} --name ${CLUSTER}
	kubectl apply -f https://raw.githubusercontent.com/nginx/kubernetes-ingress/v5.2.1/deploy/crds.yaml
	sleep 180
