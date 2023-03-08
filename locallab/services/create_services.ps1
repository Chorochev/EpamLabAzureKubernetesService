kubectl get nodes
kubectl get pods
# kubectl get deployments
kubectl get deploy
# kubectl get services
kubectl get svc

#########################################################
# create the deployment - httpd
kubectl create deployment webapp-deployment --image=httpd:latest
# scaling
kubectl scale deployment webapp-deployment --replicas 3

#########################################################
# Create a service "ClusterIP"
kubectl expose deployment webapp-deployment --type=ClusterIP --port 80
# kubectl delete deployment webapp-deployment

kubectl get services

kubectl describe nodes | Select-String ExternalIP 
kubectl describe nodes | Select-String InternalIP 

# Delete the service
kubectl delete services webapp-deployment

# #########################################################
# # Create a service "ExternalName"
# kubectl expose deployment webapp-deployment --type=ExternalName --port 80
# # The Service "webapp-deployment" is invalid: spec.externalName: Required value
# # The Service "webapp-deployment" is invalid: spec.type: Unsupported value: "externalName": supported values: "ClusterIP", "ExternalName", "LoadBalancer", "NodePort"

#########################################################
# Create a service "LoadBalancer"
kubectl expose deployment webapp-deployment --type=LoadBalancer --port 80

# Delete the service
kubectl delete services webapp-deployment
