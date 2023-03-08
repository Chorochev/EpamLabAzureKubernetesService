#########################################################
# create a LoadBalancer service (the deployment - httpd)
kubectl apply -f web_loadbalancer_service.yaml

# kubectl delete -f web_loadbalancer_service.yaml

#########################################################
# create LoadBalancer services (the deployment - httpd, pythonapp)
kubectl apply -f multi_loadbalancer_service.yaml

# kubectl delete -f multi_loadbalancer_service.yaml


#########################################################
# create HorizontalPodAutoscaler services (the deployment - httpd)
kubectl apply -f web_autoscaling_service.yaml

# kubectl delete -f web_autoscaling_service.yaml

# checking
kubectl get nodes
kubectl get pods
kubectl get deploy
kubectl get svc

# go to the internal net
minikube ssh
