$environment = "dev"
$location = "eastus" # "East US" 
$workload = "kubeEpamLab"
$instance = "01"
$resourceGroupName = "rg-$workload-$environment-$location-$instance"
$nodeResourceGroupName = "rgnode-$workload-$environment-$location-$instance"
$AKSClusterName = "aks-$workload-$environment-$location-$instance"
$containerRegistryName = "acr$workload$environment$location$instance".ToLower()
$manifestsK8s = "arc_greetings_app.yaml"

#############################################################################
Write-Host "Create a resource group: $resourceGroupName" -Foreground Green
az group create --name $resourceGroupName --location "$location"

#############################################################################
Write-Host "Create AKS cluster: $AKSClusterName" -Foreground Green
az aks create `
    --resource-group $resourceGroupName `
    --node-resource-group $nodeResourceGroupName `
    --name $AKSClusterName `
    --nodepool-name "nodepool1" `
    --node-count 2 `
    --generate-ssh-keys `
    --load-balancer-sku standard `
    --node-vm-size Standard_B2s `
    --os-sku Ubuntu

#############################################################################
# Write-Host "Add node pools." -Foreground Green
# az aks nodepool add `
#     --cluster-name $AKSClusterName `
#     --name "nodepool2" `
#     --resource-group $resourceGroupName `
#     --node-count 2 `
#     --node-vm-size Standard_B2s `
#     --os-sku Ubuntu

############################################################################
Write-Host "Create an Azure Container Registry." -Foreground Green
az acr create `
    --name $containerRegistryName `
    --resource-group $resourceGroupName `
    --sku Basic `
    --admin-enabled true

############################################################################
# Push this image into your ACR (Azure Container registry)
# Login to ACR
# az login
# az aks get-credentials --resource-group $resourceGroupName --name $AKSClusterName
az acr login --name $containerRegistryName 

# # Create a tag for the image
docker images
docker tag chorochev/simple-python-app-service acrkubeepamlabdeveastus01.azurecr.io/greetingapp:latest
# # Download the image to ACR
docker push acrkubeepamlabdeveastus01.azurecr.io/greetingapp:latest
# docker push acrkubeepamlabdeveastus01.azurecr.io/httpd:latest

# # List images of ACR
az acr repository list --name acrkubeepamlabdeveastus01.azurecr.io --output table

############################################################################
Write-Host "Attach AKS to ACR." -Foreground Green
az aks update `
    --name $AKSClusterName `
    --resource-group $resourceGroupName `
    --attach-acr $containerRegistryName 

############################################################################
# Go to '..\EpamLabAzureKubernetesService\kube\'
Set-Location ..\kube\
kubectl apply -f $manifestsK8s -n default
kubectl delete -f $manifestsK8s

# # Deploy python App service to the cluster using attached k8s manifests
# az aks command invoke `
#     --name $AKSClusterName `
#     --resource-group $resourceGroupName `
#     --command "kubectl apply -f $manifestsK8s -n default" `
#     --file $manifestsK8s

# # Cheking
# az aks command invoke `
#     --name $AKSClusterName `
#     --resource-group $resourceGroupName `
#     --command "kubectl get pods -o wide"

# az aks command invoke `
#     --name $AKSClusterName `
#     --resource-group $resourceGroupName `
#     --command "kubectl get service python-docker-front --watch"

# az aks command invoke `
#     --name $AKSClusterName `
#     --resource-group $resourceGroupName `
#     --command "kubectl get services python-docker-front"
    
