@ECHO OFF 
ECHO ============================
ECHO Stop Kubernetis (minikube)
ECHO Stop minikube

cmd /c minikube stop

ECHO Status minikube

cmd /c minikube status

ECHO Buy

timeout /t 3

exit 0
