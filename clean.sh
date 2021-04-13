kubectl delete -f ./srcs/yaml_services/ftps.yaml
kubectl delete -f ./srcs/yaml_deployments/ftps.yaml
kubectl delete -f ./srcs/yaml_volumes/ftps.yaml

kubectl delete -f ./srcs/yaml_services/grafana.yaml
kubectl delete -f ./srcs/yaml_deployments/grafana.yaml

kubectl delete -f ./srcs/yaml_services/influxdb.yaml
kubectl delete -f ./srcs/yaml_deployments/influxdb.yaml
kubectl delete -f ./srcs/yaml_volumes/influxdb.yaml

kubectl delete -f ./srcs/yaml_services/mysql.yaml
kubectl delete -f ./srcs/yaml_deployments/mysql.yaml
kubectl delete -f ./srcs/yaml_volumes/mysql.yaml

kubectl delete -f ./srcs/yaml_services/phpmyadmin.yaml
kubectl delete -f ./srcs/yaml_deployments/phpmyadmin.yaml

kubectl delete -f ./srcs/yaml_services/wordpress.yaml
kubectl delete -f ./srcs/yaml_deployments/wordpress.yaml

minikube delete