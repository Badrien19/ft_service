echo "
  __ _                           _               
 / _| |_     ___  ___ _ ____   _(_) ___ ___  ___ 
| |_| __|   / __|/ _ \ '__\ \ / / |/ __/ _ \/ __|
|  _| |_    \__ \  __/ |   \ V /| | (_|  __/\__ \\
|_|  \__|___|___/\___|_|    \_/ |_|\___\___||___/
                               
"
echo "\033[033mStarting Minikube\033[00m\n"

minikube delete
minikube start --vm-driver=docker --memory 3200m --cpus 3
#minikube start --vm-driver=virtualbox
eval $(minikube docker-env)

#minikube kubectl -- get po -A

echo "\n\033[033mConfiguring Metallb\033[00m\n"

# Metallb config:

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create -f srcs/metallb/configmap.yaml

# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

echo "\n\033[033mBuilding dockers\033[00m\n"

echo "\033[1;34m[Wordpress]\033[00m"
docker build -t service_wordpress ./srcs/wordpress
echo "\n\033[1;34m[Nginx]\033[00m"
docker build -t service_nginx ./srcs/nginx
echo "\n\033[1;34m[Grafana]\033[00m"
docker build -t service_grafana ./srcs/grafana
echo "\n\033[1;34m[Mysql]\033[00m"
docker build -t service_mysql ./srcs/mysql
echo "\n\033[1;34m[Phpmyadmin]\033[00m"
docker build -t service_phpmyadmin ./srcs/phpmyadmin


DB_NAME=BOURDANNE_DB; DB_USER=BOURDANNE; DB_PASSWORD=password; DB_HOST=mysql;

echo "\n\033[033mGenerating secrets\033[00m\n"

kubectl create secret generic db-id \
	--from-literal=name=${DB_NAME} \
	--from-literal=user=${DB_USER} \
	--from-literal=password=${DB_PASSWORD} \
	--from-literal=host=${DB_HOST}l


echo "\n\033[033mImporting config files\033[00m\n"

kubectl create -f ./srcs/nginx/nginx.yaml
kubectl create -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl create -f ./srcs/grafana/grafana.yaml
kubectl create -f ./srcs/mysql/mysql.yaml
kubectl create -f ./srcs/wordpress/wordpress.yaml


minikube dashboard