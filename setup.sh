echo "
  __ _                           _               
 / _| |_     ___  ___ _ ____   _(_) ___ ___  ___ 
| |_| __|   / __|/ _ \ '__\ \ / / |/ __/ _ \/ __|
|  _| |_    \__ \  __/ |   \ V /| | (_|  __/\__ \\
|_|  \__|___|___/\___|_|    \_/ |_|\___\___||___/
                               
"
echo "\033[033mStarting Minikube\033[00m\n"

minikube delete
minikube start --vm-driver=docker --memory 5000m --cpus 4
#minikube start --vm-driver=virtualbox
eval $(minikube docker-env)

#minikube kubectl -- get po -A

echo "\n\033[033mConfiguring Metallb\033[00m\n"

# Metallb config:

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create -f srcs/yaml_metallb/metallb.yaml

# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

echo "\n\033[033mBuilding dockers\033[00m\n"

echo "\033[1;34m1/7 [Wordpress]\033[00m"
docker build -t img_wordpress ./srcs/wordpress
echo "\n\033[1;34m2/7 [Influxdb]\033[00m"
docker build -t img_influxdb ./srcs/influxdb
echo "\n\033[1;34m3/7 [Nginx]\033[00m"
docker build -t img_nginx ./srcs/nginx
echo "\n\033[1;34m4/7 [Grafana]\033[00m"
docker build -t img_grafana ./srcs/grafana
echo "\n\033[1;34m5/7 [Mysql]\033[00m"
docker build -t img_mysql ./srcs/mysql
echo "\n\033[1;34m6/7 [Phpmyadmin]\033[00m"
docker build -t img_phpmyadmin ./srcs/phpmyadmin
echo "\n\033[1;34m7/7 [FTPS]\033[00m"
docker build -t img_ftps ./srcs/ftps

echo "\n\033[033mCreating Deployments\033[00m\n"
kubectl create -f ./srcs/yaml_deployments/ftps.yaml
kubectl create -f ./srcs/yaml_deployments/grafana.yaml
kubectl create -f ./srcs/yaml_deployments/influxdb.yaml
kubectl create -f ./srcs/yaml_deployments/mysql.yaml
kubectl create -f ./srcs/yaml_deployments/nginx.yaml
kubectl create -f ./srcs/yaml_deployments/phpmyadmin.yaml
kubectl create -f ./srcs/yaml_deployments/wordpress.yaml

echo "\n\033[033mCreating VolumeClaim\033[00m\n"
kubectl create -f ./srcs/yaml_volumes/ftps.yaml
kubectl create -f ./srcs/yaml_volumes/influxdb.yaml
kubectl create -f ./srcs/yaml_volumes/mysql.yaml

echo "\n\033[033mCreating Services\033[00m\n"
kubectl create -f ./srcs/yaml_services/ftps.yaml
kubectl create -f ./srcs/yaml_services/grafana.yaml
kubectl create -f ./srcs/yaml_services/influxdb.yaml
kubectl create -f ./srcs/yaml_services/mysql.yaml
kubectl create -f ./srcs/yaml_services/nginx.yaml
kubectl create -f ./srcs/yaml_services/phpmyadmin.yaml
kubectl create -f ./srcs/yaml_services/wordpress.yaml

echo "\n\033[033mStarting Dashboard\033[00m\n"
minikube dashboard