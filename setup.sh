echo "
  __ _                           _               
 / _| |_     ___  ___ _ ____   _(_) ___ ___  ___ 
| |_| __|   / __|/ _ \ '__\ \ / / |/ __/ _ \/ __|
|  _| |_    \__ \  __/ |   \ V /| | (_|  __/\__ \\
|_|  \__|___|___/\___|_|    \_/ |_|\___\___||___/
                               
"
echo "____Starting Minikube____"

minikube start
# kubectl get po -A 

echo "____Configuring Metallb____"

# Metallb config:
kubectl apply -f srcs/metallb/metallb.yaml
kubectl create -f srcs/metallb/configmap.yaml
