#########################################################
# create the deployment - httpd
kubectl apply -f web_deployment.yaml

kubectl delete -f web_deployment.yaml

#########################################################
# create the deployment - chorochev/simple-python-app-service
kubectl apply -f pythonapp_deployment.yaml

kubectl delete -f pythonapp_deployment.yaml

# checking
kubectl get pods
kubectl port-forward webapp-dd9d6c7c5-dhmnb 7000:80
kubectl port-forward pythonapp-6b6bc99649-8htwr 9000:5000
