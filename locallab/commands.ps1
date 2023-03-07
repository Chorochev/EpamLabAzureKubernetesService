kubectl get nodes
kubectl get pods

#########################################################
# create the pod - httpd
kubectl apply -f web_pod.yaml

kubectl describe pods web-app

kubectl port-forward web-app 7000:80
# http://localhost:7000

kubectl delete -f web_pod.yaml

#########################################################
# create the pod - chorochev/simple-python-app-service
# !!!! --port=5000
kubectl apply -f pythonapp_pod.yaml

kubectl describe pods pythonapp

kubectl port-forward pythonapp 9000:5000
# http://localhost:9000

kubectl delete -f pythonapp_pod.yaml
