$environment = "dev"
$location = "eastus" # "East US" 
$workload = "kubeEpamLab"
$instance = "01"
$resourceGroupName = "rg-$workload-$environment-$location-$instance"
$nodeResourceGroupName = "rgnode-$workload-$environment-$location-$instance"
$AKSClusterName = "aks-$workload-$environment-$location-$instance"
$containerRegistryName = "acr$workload$environment$location$instance".ToLower()

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
    --node-count 1 `
    --generate-ssh-keys `
    --load-balancer-sku standard `
    --node-vm-size Standard_B2s `
    --os-sku Ubuntu

#############################################################################
Write-Host "Add node pools." -Foreground Green
az aks nodepool add `
    --cluster-name $AKSClusterName `
    --name "nodepool2" `
    --resource-group $resourceGroupName `
    --node-count 2 `
    --node-vm-size Standard_B2s `
    --os-sku Ubuntu

############################################################################
Write-Host "Create an Azure Container Registry." -Foreground Green
az acr create `
    --name $containerRegistryName `
    --resource-group $resourceGroupName `
    --sku Basic `
    --admin-enabled true
