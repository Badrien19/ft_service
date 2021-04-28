# FT_SERVICE

## Identifiants

Service | Identifiant | Password
---|---|---
Wordpress   | wp_user | password  
Phpmyadmin  | wp_user | wp_pass  
Mysql       | wp_user | wp_pass  
Grafana     | admin | admin  
Ftps        | ftp_admin | ftp_pass

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