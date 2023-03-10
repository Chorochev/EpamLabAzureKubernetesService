kubectl get nodes
kubectl get nodes --show-labels
kubectl get pods --output=wide

# Add a label to a node
# # "frontend"
kubectl label nodes minikube tier=frontend
# "backend"
# kubectl label nodes minikube tier=backend
# # delete label
# kubectl label nodes minikube tier-

###############################################################
# Create pod NGINX
kubectl apply -f pod-nginx.yaml

# Cheking
kubectl describe pods pod-nginx
kubectl port-forward pod-nginx 7000:80

# Deleting
kubectl delete -f pod-nginx.yaml

###############################################################
# Create pod REDIS
kubectl apply -f pod-redis.yaml

# Cheking
kubectl describe pods pod-redis
kubectl port-forward pod-redis 6379:6379

# Deleting
kubectl delete -f pod-redis.yaml


###############################################################
# Create pod pythonapp
kubectl apply -f pod-pythonapp.yaml

# Cheking
kubectl describe pods pod-pythonapp
kubectl port-forward pod-pythonapp 8000:5000

# Deleting
kubectl delete -f pod-pythonapp.yaml

###############################################################
# Create pod epamlab-greetings
kubectl apply -f pod-epamlab-greetings.yaml

# Cheking
kubectl describe pods pod-epamlab-greetings
kubectl port-forward pod-epamlab-greetings 9000:5000

# Deleting
kubectl delete -f pod-epamlab-greetings.yaml


# go to the internal net
minikube ssh

# Checking
kubectl exec -it pod-pythonapp sh
kubectl exec -it pod-epamlab-greetings sh
