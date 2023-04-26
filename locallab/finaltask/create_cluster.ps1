#########################################################
# commands
# docker login
docker images
kubectl get nodes
kubectl get nodes --show-labels
# kubectl get deployments
kubectl get deploy
# kubectl get services
kubectl get svc
kubectl get pods --output=wide

kubectl describe pod greetings-69494fdd59-pjdn4
kubectl logs greetings-69494fdd59-pjdn4

#########################################################
# Add a label to a node
# # "frontend"
kubectl label nodes minikube tier=frontend
# "backend"
# kubectl label nodes minikube tier=backend
# # delete label
# kubectl label nodes minikube tier-

#########################################################
# create the deployment
kubectl apply -f greetings-app.yaml
# delete the deployment
kubectl delete -f greetings-app.yaml


#########################################################
# checking
# kubectl port-forward webapp-dd9d6c7c5-dhmnb 7000:80
# kubectl port-forward greetings-79d4b65d8d-xc7qj 9000:5000
# deleting
# kubectl delete pods greetings-app 
# kubectl describe deployment pythonapp
# kubectl describe pod redis-746f7f84f6-5pngc
kubectl exec -it greetings-6c7d78d9f5-xs9vt sh