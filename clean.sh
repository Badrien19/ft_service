kubectl delete -f ./srcs/yaml_deployments/nginx.yaml
kubectl delete -f ./srcs/yaml_deployments/phpmyadmin.yaml
kubectl delete -f ./srcs/yaml_deployments/grafana.yaml
kubectl delete -f ./srcs/yaml_deployments/mysql.yaml
kubectl delete -f ./srcs/yaml_deployments/wordpress.yaml
kubectl delete -f ./srcs/yaml_deployments/influxdb.yaml
kubectl delete -f ./srcs/yaml_deployments/ftps.yaml

minikube delete