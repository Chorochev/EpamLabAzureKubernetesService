kubectl get nodes
kubectl get pods
kubectl get deployments
kubectl get deploy
kubectl get rs
kubectl get hpa
kubectl rollout history deployment/webapp-deployment
kubectl rollout status deployment/webapp-deployment
kubectl rollout undo deployment/webapp-deployment
kubectl rollout restart deployment/webapp-deployment
kubectl delete deployment webapp-deployment

#########################################################
# create the deployment - httpd
kubectl create deployment webapp-deployment --image=httpd:latest

kubectl describe deployment webapp-deployment

# kubectl describe pods webapp-deployment-6cf488df5f-8ttlq 

# scaling
kubectl scale deployment webapp-deployment --replicas 4
kubectl get rs

# testing scaling
kubectl get pods
kubectl delete pods webapp-deployment-6cf488df5f-6jb4x
kubectl get pods

# autoscale
kubectl autoscale deployment webapp-deployment --min=4 --max=6 --cpu-percent=80
kubectl get hpa

# set image
# kubectl set image deployment/webapp-deployment httpd:latest --record
# kubectl rollout undo deployment/webapp-deployment

kubectl rollout restart deployment/webapp-deployment

# delete deployment
kubectl delete deployment webapp-deployment
