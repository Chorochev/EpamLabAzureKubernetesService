# Connect to Azure
# az login

$location = "eastus" # "East US"
$resourceGroupName = "rg-kubeEpamLab-dev-eastus-001"
$AKSClusterName = "aks-kubeEpamLab-dev-eastus-001"

#############################################################################
Write-Host "Create a resource group: $resourceGroupName" -Foreground Green
az group create --name $resourceGroupName --location $location

#############################################################################
Write-Host "Create AKS cluster: $resourceGroupName" -Foreground Green
az aks create `
    --resource-group $resourceGroupName `
    --name $AKSClusterName `
    --enable-managed-identity `
    --node-count 1 `
    --enable-addons monitoring `
    --enable-msi-auth-for-monitoring  `
    --generate-ssh-keys

#############################################################################
Write-Host "Deleting old credentials." -Foreground Yellow
Remove-Item -Path "$env:USERPROFILE\.kube\" -Force -Recurse

#############################################################################
Write-Host "Connect to the cluster: $resourceGroupName" -Foreground Green
az aks get-credentials --resource-group $resourceGroupName --name $AKSClusterName

#############################################################################
Write-Host "Checking" -Foreground Green
kubectl get nodes

#############################################################################
Write-Host "Deploy the application" -Foreground Green
kubectl apply -f azure-vote.yaml

#############################################################################
Write-Host "Test the application" -Foreground Green
kubectl get service azure-vote-front --watch
