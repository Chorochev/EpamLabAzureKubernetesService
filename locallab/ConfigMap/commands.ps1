kubectl get nodes
kubectl get pods
kubectl get configmap
kubectl delete configmap myconfigmap

#########################################################
kubectl apply -f configmap-pod.yaml
kubectl delete -f configmap-pod.yaml

# go to pod
kubectl exec -it web-app sh