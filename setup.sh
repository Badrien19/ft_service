echo "
  __ _                           _               
 / _| |_     ___  ___ _ ____   _(_) ___ ___  ___ 
| |_| __|   / __|/ _ \ '__\ \ / / |/ __/ _ \/ __|
|  _| |_    \__ \  __/ |   \ V /| | (_|  __/\__ \\
|_|  \__|___|___/\___|_|    \_/ |_|\___\___||___/
                               
"
echo "
____Starting Minikube____
"

minikube delete
minikube start --vm-driver=docker
minikube kubectl -- get po -A

echo "
____Configuring Metallb____
"

# Metallb config:

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml

# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

#kubectl apply -f srcs/metallb/metallb.yaml
kubectl create -f srcs/metallb/configmap.yaml

eval $(minikube docker-env)

echo "
____Building dockers____
"
#docker build -t service_wordpress ./srcs/wordpress
docker build -t service_nginx ./srcs/nginx

kubectl create -f ./srcs/nginx/nginx.yaml

minikube dashboard