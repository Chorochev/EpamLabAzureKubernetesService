$environment = "dev"
$location = "eastus" # "East US" 
$workload = "kubeEpamLab"
$instance = "01"
$resourceGroupName = "rg-$workload-$environment-$location-$instance"
$nodeResourceGroupName = "rgnode-$workload-$environment-$location-$instance"
$AKSClusterName = "aks-$workload-$environment-$location-$instance"

#############################################################################
Write-Host "Create a resource group: $resourceGroupName" -Foreground Green
az group create --name $resourceGroupName --location $location

#############################################################################
Write-Host "Create a network watcher" -Foreground Green
az network watcher configure --resource-group $resourceGroupName --locations $location --enabled

#############################################################################
Write-Host "Create AKS cluster: $AKSClusterName" -Foreground Green
az aks create `
    --resource-group $resourceGroupName `
    --node-resource-group $nodeResourceGroupName `
    --name $AKSClusterName `
    --enable-managed-identity `
    --vm-set-type VirtualMachineScaleSets `
    --node-count 1 `
    --enable-addons monitoring `
    --enable-msi-auth-for-monitoring `
    --generate-ssh-keys `
    --load-balancer-sku standard 

# Connect to the cluster
# 1) Install kubectl locally 
az aks install-cli

# 2) Configure kubectl to connect to your Kubernetes cluster
az aks get-credentials --resource-group $resourceGroupName --name $AKSClusterName 

# 3) Verify the connection
kubectl get nodes

# 4) Deploy the application
kubectl apply -f azure-vote.yaml