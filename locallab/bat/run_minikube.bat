@ECHO OFF 
ECHO ============================
ECHO Running Kubernetis (minikube)
ECHO Running Docker Desktop

start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"

ECHO Waiting Docker Desktop 35 seconds ...

timeout /t 35

ECHO Running minikube

cmd /c minikube start

ECHO Checking minikube

cmd /c minikube status

ECHO Buy

timeout /t 3

exit 0
