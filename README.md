# ft_services

# minikube
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

# wordpress

When "kustomization.yaml" is ready:
kubectl apply -k ./ -> Apply the modifications

kubectl get secrets -> Check secrets
kubectl get pvc -> Check PermanentVolume

kubectl get pods -> Verify the pods

kubectl get services wordpress -> Check that the service wordpress is running

minikube service wordpress --url -> Get the URL for wordpress

kubectl delete -k ./ -> /!\ Undo "kubectl apply -k ./"

# ressourses

----geting stated----

https://harm-smits.github.io/42docs/projects/ft_services

----install minikube----

https://minikube.sigs.k8s.io/docs/start/

----install wordpress & mysql----

https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/
