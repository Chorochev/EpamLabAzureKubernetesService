kubectl get nodes
kubectl get pods

#########################################################
# create the pod - httpd
kubectl run testhello --image=httpd:latest --port=80

# Checking
kubectl describe pods testhello
kubectl exec testhello date
kubectl exec -it testhello sh

kubectl port-forward testhello 7777:80
# http://localhost:7777

# deleting
kubectl delete pods testhello

#########################################################
# create the pod - chorochev/simple-python-app-service
# !!!! --port=5000
docker images
kubectl run pythonapp --image=chorochev/simple-python-app-service:latest --port=5000

# Checking
kubectl describe pods pythonapp
kubectl exec pythonapp date
kubectl exec -it pythonapp sh

kubectl port-forward pythonapp 7777:5000
# http://localhost:7777

# deleting
kubectl delete pods pythonapp