# FT_SERVICE

## Identifiants

Service | Identifiant | Password
---|---|---
Wordpress   | wp_user | password  
Phpmyadmin  | wp_user | wp_pass  
Mysql       | wp_user | wp_pass  
Grafana     | admin | admin  
Ftps        | ftp_admin | ftp_pass

## TODO

### ALL
- Check restart des Containers
- Ajouter les deployments
- Mettre au propre

### MYSQL
- Check PersistantVolume

## TIPS
CTRL+Maj+V to preview README in VS Code

/!\ 
IMPORTANT 
If you are using the school VM, first give you permission to use docker  
```sudo groupadd docker```  
```sudo usermod -aG docker $USER```  
Then shutdown VirtualBox and restart  
Don't forget to give at least 3 CPU to VirtualBox.  
Help : https://docs.docker/engine/install/ubuntu
/!\


## TIPS FOR BADRIEN

minikube start --vm-driver=virtualbox

If you can't reach web page (not dashboard)  
->```minukube ip```
192.168.49.2

change in metaldb configmap.yaml last two line  
addresses:  
    - 192.168.49.10-192.168.49.20

---

## Ressources
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