minikube logs > logs.txt

minikube config set driver docker
minikube delete
minikube start --driver=docker