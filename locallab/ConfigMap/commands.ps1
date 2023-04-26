kubectl get nodes
kubectl get pods
kubectl get configmap
kubectl delete configmap myconfigmap
kubectl get deploy

#########################################################
kubectl apply -f configmap-pod.yaml
kubectl delete -f configmap-pod.yaml

# go to pod
kubectl exec -it web-app sh
# echo $MYEPAMLABNAME

kubectl apply -f configmap-deployment.yaml
kubectl delete -f configmap-deployment.yaml
# go to pod
kubectl get pods
kubectl exec -it webapp-774776dcc5-gfx2q sh
# ls -all
# cat myname.txt