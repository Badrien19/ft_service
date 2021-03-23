# FT_SERVICE

mini## Minikube
minikube start

kubectl get po -A -> Access to the cluster

minikube dashboard -> Display dashboard

Deploy an app:

kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4

kubectl expose deployment hello-minikube --type=NodePort --port=8080

kubectl get services hello-minikube

minikube service hello-minikube

kubectl port-forward service/hello-minikube 7080:8080

--> http://localhost:7080/

## Wordpress
When "kustomization.yaml" is ready:

kubectl apply -k ./ -> Apply the modifications

kubectl get secrets -> Check secrets

kubectl get pvc -> Check PermanentVolume

kubectl get pods -> Verify the pods

kubectl get services wordpress -> Check that the service wordpress is running

minikube service wordpress --url -> Get the URL for wordpress

kubectl delete -k ./ -> /!\ Undo "kubectl apply -k ./"

## Grafana
kubectl create deployment grafana --image=docker.io/grafana/grafana:5.4.3

kubectl get deployments

kubectl get svc

kubectl expose deployment grafana --type=LoadBalancer --port=80 --target-port=3000 --protocol=TCP

kubectl get service grafana

kubectl scale deployment grafana --replicas=2

## ressourses
----Getting started----

https://harm-smits.github.io/42docs/projects/ft_services

----Install minikube----

https://minikube.sigs.k8s.io/docs/start/

----Install wordpress & mysql----

https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/

----Install graphana---

https://www.metricfire.com/blog/deploying-grafana-to-kubernetes/?GAID=1300009325.1613665265

----liveness----

https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/

----Install phpmyadmin----

https://www.serverlab.ca/tutorials/containers/kubernetes/deploy-phpmyadmin-to-kubernetes-to-manage-mysql-pods/

## TODO

# Wordpress
- Storage persistent
- Lier la base de donnée
- Vérifier pour nginx

## TIPS
CTRL+Maj+V to preview README in VS Code

sudo service network-manager restart

/!\ IMPORTANT if you are using the school VM, first give you permission to use docker
sudo groupadd docker
sudo usermod -aG docker $USER
Help : https://docs.docker/engine/install/ubuntu
then shutdown VirtualBox and restart /!\
